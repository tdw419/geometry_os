; DESCRIPTION: Renders a cyan line between points (232, 155) and (185, 142).
; PLAN: r0=232(x1), r1=155(y1), r2=185(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 155
LDI r2, 185
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
