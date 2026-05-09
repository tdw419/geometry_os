; DESCRIPTION: Composite: Places a purple line segment connecting (13, 152) to (95, 192) then Creates a green rectangular region at (329, 92) spanning 15 by 71 pixels then Places a blue circle of radius 60 at center (448, 135).
; PLAN: r0=13(x1), r1=152(y1), r2=95(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=92(y), r7=15(width), r8=71(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x), r11=135(y), r12=60(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 13
LDI r1, 152
LDI r2, 95
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 92
LDI r7, 15
LDI r8, 71
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 135
LDI r12, 60
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
