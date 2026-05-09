; DESCRIPTION: Places a orange line segment connecting (504, 145) to (52, 4).
; PLAN: r0=504(x1), r1=145(y1), r2=52(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 145
LDI r2, 52
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
