; DESCRIPTION: Composite: Renders a purple line between points (332, 114) and (145, 186) then Renders a magenta disk with center (126, 128) and radius 28 then Creates a yellow rectangular region at (146, 55) spanning 87 by 49 pixels.
; PLAN: r0=332(x1), r1=114(y1), r2=145(x2), r3=186(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=128(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=55(y), r12=87(width), r13=49(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 114
LDI r2, 145
LDI r3, 186
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 128
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 55
LDI r12, 87
LDI r13, 49
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
