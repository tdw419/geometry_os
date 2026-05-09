; DESCRIPTION: Places a orange line segment connecting (417, 178) to (17, 168).
; PLAN: r0=417(x1), r1=178(y1), r2=17(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 178
LDI r2, 17
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
