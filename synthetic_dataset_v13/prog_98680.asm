; DESCRIPTION: Renders a red line between points (145, 122) and (477, 250).
; PLAN: r0=145(x1), r1=122(y1), r2=477(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 122
LDI r2, 477
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
