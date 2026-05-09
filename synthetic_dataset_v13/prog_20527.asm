; DESCRIPTION: Composite: Draws a white circle centered at (363, 70) with radius 63 then Places a orange line segment connecting (30, 140) to (78, 211).
; PLAN: r0=363(x), r1=70(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=140(y1), r7=78(x2), r8=211(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 70
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 140
LDI r7, 78
LDI r8, 211
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
