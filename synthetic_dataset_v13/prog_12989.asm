; DESCRIPTION: Places a orange line segment connecting (334, 13) to (251, 196).
; PLAN: r0=334(x1), r1=13(y1), r2=251(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 13
LDI r2, 251
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
