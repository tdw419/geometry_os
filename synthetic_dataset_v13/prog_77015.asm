; DESCRIPTION: Places a orange line segment connecting (96, 51) to (503, 130).
; PLAN: r0=96(x1), r1=51(y1), r2=503(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 51
LDI r2, 503
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
