; DESCRIPTION: Renders a black line between points (189, 158) and (49, 133).
; PLAN: r0=189(x1), r1=158(y1), r2=49(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 158
LDI r2, 49
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
