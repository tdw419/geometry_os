; DESCRIPTION: Renders a red line between points (458, 4) and (47, 136).
; PLAN: r0=458(x1), r1=4(y1), r2=47(x2), r3=136(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 4
LDI r2, 47
LDI r3, 136
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
