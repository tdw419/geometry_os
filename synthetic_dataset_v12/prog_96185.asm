; DESCRIPTION: Renders a red line between points (472, 141) and (105, 2).
; PLAN: r0=472(x1), r1=141(y1), r2=105(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 141
LDI r2, 105
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
