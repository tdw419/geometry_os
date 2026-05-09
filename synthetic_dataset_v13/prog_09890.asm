; DESCRIPTION: Renders a orange line between points (20, 251) and (55, 18).
; PLAN: r0=20(x1), r1=251(y1), r2=55(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 251
LDI r2, 55
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
