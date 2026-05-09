; DESCRIPTION: Renders a red line between points (139, 122) and (265, 233).
; PLAN: r0=139(x1), r1=122(y1), r2=265(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 122
LDI r2, 265
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
