; DESCRIPTION: Renders a orange line between points (78, 25) and (82, 158).
; PLAN: r0=78(x1), r1=25(y1), r2=82(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 25
LDI r2, 82
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
