; DESCRIPTION: Renders a blue line between points (478, 245) and (211, 246).
; PLAN: r0=478(x1), r1=245(y1), r2=211(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 245
LDI r2, 211
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
