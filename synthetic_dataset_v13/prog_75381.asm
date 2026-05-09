; DESCRIPTION: Renders a yellow line between points (388, 174) and (367, 119).
; PLAN: r0=388(x1), r1=174(y1), r2=367(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 174
LDI r2, 367
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
