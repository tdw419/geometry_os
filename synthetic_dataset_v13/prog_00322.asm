; DESCRIPTION: Composite: Renders a white disk with center (369, 159) and radius 42 then Draws a magenta rectangle at (379, 35) with width 71 and height 70 then Draws a green line from (469, 175) to (377, 213).
; PLAN: r0=369(x), r1=159(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=35(y), r7=71(width), r8=70(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x1), r11=175(y1), r12=377(x2), r13=213(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 159
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 35
LDI r7, 71
LDI r8, 70
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 175
LDI r12, 377
LDI r13, 213
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
