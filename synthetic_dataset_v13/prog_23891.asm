; DESCRIPTION: Renders a red line between points (155, 26) and (491, 138).
; PLAN: r0=155(x1), r1=26(y1), r2=491(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 26
LDI r2, 491
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
