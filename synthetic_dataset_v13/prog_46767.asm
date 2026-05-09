; DESCRIPTION: Renders a yellow line between points (477, 47) and (466, 137).
; PLAN: r0=477(x1), r1=47(y1), r2=466(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 47
LDI r2, 466
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
