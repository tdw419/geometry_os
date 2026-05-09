; DESCRIPTION: Places a orange line segment connecting (48, 216) to (417, 185).
; PLAN: r0=48(x1), r1=216(y1), r2=417(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 216
LDI r2, 417
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
