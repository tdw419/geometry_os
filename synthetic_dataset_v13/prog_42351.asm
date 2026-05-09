; DESCRIPTION: Renders a red line between points (145, 136) and (287, 28).
; PLAN: r0=145(x1), r1=136(y1), r2=287(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 136
LDI r2, 287
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
