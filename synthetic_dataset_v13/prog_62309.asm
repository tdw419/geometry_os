; DESCRIPTION: Places a orange line segment connecting (1, 93) to (88, 124).
; PLAN: r0=1(x1), r1=93(y1), r2=88(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 93
LDI r2, 88
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
