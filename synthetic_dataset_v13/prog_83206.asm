; DESCRIPTION: Renders a orange line between points (430, 35) and (82, 15).
; PLAN: r0=430(x1), r1=35(y1), r2=82(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 35
LDI r2, 82
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
