; DESCRIPTION: Renders a orange line between points (365, 88) and (14, 35).
; PLAN: r0=365(x1), r1=88(y1), r2=14(x2), r3=35(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 88
LDI r2, 14
LDI r3, 35
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
