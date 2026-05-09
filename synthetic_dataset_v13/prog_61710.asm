; DESCRIPTION: Places a orange line segment connecting (215, 201) to (484, 226).
; PLAN: r0=215(x1), r1=201(y1), r2=484(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 201
LDI r2, 484
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
