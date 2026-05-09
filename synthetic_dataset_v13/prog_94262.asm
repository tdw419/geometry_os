; DESCRIPTION: Renders a yellow line between points (432, 82) and (359, 114).
; PLAN: r0=432(x1), r1=82(y1), r2=359(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 82
LDI r2, 359
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
