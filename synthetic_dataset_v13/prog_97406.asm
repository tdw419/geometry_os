; DESCRIPTION: Renders a green line between points (388, 232) and (233, 11).
; PLAN: r0=388(x1), r1=232(y1), r2=233(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 232
LDI r2, 233
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
