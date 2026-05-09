; DESCRIPTION: Composite: Renders a blue disk with center (338, 153) and radius 66 then Creates a yellow rectangular region at (180, 44) spanning 14 by 117 pixels then Renders a purple line between points (256, 68) and (87, 197).
; PLAN: r0=338(x), r1=153(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x), r6=44(y), r7=14(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x1), r11=68(y1), r12=87(x2), r13=197(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 153
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 44
LDI r7, 14
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 68
LDI r12, 87
LDI r13, 197
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
