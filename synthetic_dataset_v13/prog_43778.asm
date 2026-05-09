; DESCRIPTION: Renders a red line between points (251, 2) and (53, 136).
; PLAN: r0=251(x1), r1=2(y1), r2=53(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 2
LDI r2, 53
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
