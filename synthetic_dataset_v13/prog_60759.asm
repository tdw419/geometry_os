; DESCRIPTION: Composite: Places a cyan line segment connecting (433, 148) to (49, 214) then Creates a green rectangular region at (24, 114) spanning 13 by 56 pixels then Renders a black disk with center (163, 185) and radius 52.
; PLAN: r0=433(x1), r1=148(y1), r2=49(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=114(y), r7=13(width), r8=56(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=163(x), r11=185(y), r12=52(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 148
LDI r2, 49
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 114
LDI r7, 13
LDI r8, 56
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 163
LDI r11, 185
LDI r12, 52
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
