; DESCRIPTION: Composite: Places a orange line segment connecting (172, 84) to (395, 94) then Creates a green rectangular region at (181, 119) spanning 65 by 64 pixels.
; PLAN: r0=172(x1), r1=84(y1), r2=395(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=119(y), r7=65(width), r8=64(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 84
LDI r2, 395
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 119
LDI r7, 65
LDI r8, 64
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
