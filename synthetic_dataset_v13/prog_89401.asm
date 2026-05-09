; DESCRIPTION: Places a orange line segment connecting (324, 161) to (131, 196).
; PLAN: r0=324(x1), r1=161(y1), r2=131(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 161
LDI r2, 131
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
