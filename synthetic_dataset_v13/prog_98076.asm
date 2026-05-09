; DESCRIPTION: Places a orange line segment connecting (126, 232) to (65, 200).
; PLAN: r0=126(x1), r1=232(y1), r2=65(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 232
LDI r2, 65
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
