; DESCRIPTION: Places a orange line segment connecting (180, 183) to (297, 201).
; PLAN: r0=180(x1), r1=183(y1), r2=297(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 183
LDI r2, 297
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
