; DESCRIPTION: Places a orange line segment connecting (73, 229) to (400, 52).
; PLAN: r0=73(x1), r1=229(y1), r2=400(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 229
LDI r2, 400
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
