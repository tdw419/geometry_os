; DESCRIPTION: Draws a yellow line from (478, 250) to (155, 237).
; PLAN: r0=478(x1), r1=250(y1), r2=155(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 250
LDI r2, 155
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
