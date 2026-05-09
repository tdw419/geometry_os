; DESCRIPTION: Places a orange line segment connecting (399, 201) to (317, 159).
; PLAN: r0=399(x1), r1=201(y1), r2=317(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 201
LDI r2, 317
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
