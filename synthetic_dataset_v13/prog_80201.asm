; DESCRIPTION: Renders a orange line between points (381, 82) and (477, 162).
; PLAN: r0=381(x1), r1=82(y1), r2=477(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 82
LDI r2, 477
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
