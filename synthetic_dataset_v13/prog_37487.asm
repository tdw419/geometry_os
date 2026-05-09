; DESCRIPTION: Renders a red line between points (472, 235) and (24, 25).
; PLAN: r0=472(x1), r1=235(y1), r2=24(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 235
LDI r2, 24
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
