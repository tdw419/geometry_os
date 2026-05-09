; DESCRIPTION: Renders a red line between points (230, 41) and (490, 155).
; PLAN: r0=230(x1), r1=41(y1), r2=490(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 41
LDI r2, 490
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
