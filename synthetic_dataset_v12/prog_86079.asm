; DESCRIPTION: Composite: Places a purple dot at position (409, 79) then Places a orange line segment connecting (312, 23) to (159, 152).
; PLAN: r0=409(x), r1=79(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=312(x1), r6=23(y1), r7=159(x2), r8=152(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 79
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 23
LDI r7, 159
LDI r8, 152
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
