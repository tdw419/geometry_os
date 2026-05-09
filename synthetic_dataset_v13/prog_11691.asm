; DESCRIPTION: Composite: Places a purple dot at position (360, 105) then Places a orange line segment connecting (444, 223) to (421, 105).
; PLAN: r0=360(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=223(y1), r7=421(x2), r8=105(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 444
LDI r6, 223
LDI r7, 421
LDI r8, 105
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
