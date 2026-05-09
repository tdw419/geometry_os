; DESCRIPTION: Places a orange line segment connecting (506, 201) to (285, 247).
; PLAN: r0=506(x1), r1=201(y1), r2=285(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 201
LDI r2, 285
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
