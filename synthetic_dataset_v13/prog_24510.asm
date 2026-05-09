; DESCRIPTION: Composite: Places a cyan line segment connecting (395, 4) to (493, 252) then Creates a purple rectangular region at (289, 33) spanning 102 by 78 pixels then Draws a white circle centered at (238, 200) with radius 10.
; PLAN: r0=395(x1), r1=4(y1), r2=493(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=33(y), r7=102(width), r8=78(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=200(y), r12=10(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 395
LDI r1, 4
LDI r2, 493
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 33
LDI r7, 102
LDI r8, 78
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 200
LDI r12, 10
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
