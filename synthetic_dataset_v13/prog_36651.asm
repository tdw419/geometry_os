; DESCRIPTION: Renders a black line between points (29, 155) and (75, 59).
; PLAN: r0=29(x1), r1=155(y1), r2=75(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 155
LDI r2, 75
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
