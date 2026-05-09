; DESCRIPTION: Composite: Creates a green circular shape at (390, 108) with radius 41 then Places a orange line segment connecting (11, 66) to (263, 233).
; PLAN: r0=390(x), r1=108(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=66(y1), r7=263(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 108
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 66
LDI r7, 263
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
