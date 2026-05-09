; DESCRIPTION: Renders a purple line between points (389, 41) and (156, 56).
; PLAN: r0=389(x1), r1=41(y1), r2=156(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 41
LDI r2, 156
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
