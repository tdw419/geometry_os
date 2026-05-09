; DESCRIPTION: Renders a red line between points (407, 155) and (29, 1).
; PLAN: r0=407(x1), r1=155(y1), r2=29(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 155
LDI r2, 29
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
