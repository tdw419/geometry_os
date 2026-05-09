; DESCRIPTION: Renders a red line between points (247, 217) and (461, 4).
; PLAN: r0=247(x1), r1=217(y1), r2=461(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 217
LDI r2, 461
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
