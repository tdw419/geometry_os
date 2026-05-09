; DESCRIPTION: Renders a orange line between points (82, 114) and (458, 114).
; PLAN: r0=82(x1), r1=114(y1), r2=458(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 114
LDI r2, 458
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
