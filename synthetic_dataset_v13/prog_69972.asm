; DESCRIPTION: Renders a red line between points (341, 69) and (226, 185).
; PLAN: r0=341(x1), r1=69(y1), r2=226(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 69
LDI r2, 226
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
