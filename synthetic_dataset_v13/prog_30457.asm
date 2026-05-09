; DESCRIPTION: Renders a black line between points (118, 155) and (290, 131).
; PLAN: r0=118(x1), r1=155(y1), r2=290(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 155
LDI r2, 290
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
