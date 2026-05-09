; DESCRIPTION: Renders a orange line between points (291, 15) and (308, 78).
; PLAN: r0=291(x1), r1=15(y1), r2=308(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 15
LDI r2, 308
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
