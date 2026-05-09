; DESCRIPTION: Composite: Draws a magenta rectangle at (249, 141) with width 112 and height 31 then Renders a cyan disk with center (346, 154) and radius 42 then Renders a purple line between points (364, 210) and (494, 226).
; PLAN: r0=249(x), r1=141(y), r2=112(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=154(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=364(x1), r11=210(y1), r12=494(x2), r13=226(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 141
LDI r2, 112
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 154
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 364
LDI r11, 210
LDI r12, 494
LDI r13, 226
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
