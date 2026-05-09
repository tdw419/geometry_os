; DESCRIPTION: Renders a purple line between points (394, 250) and (478, 250).
; PLAN: r0=394(x1), r1=250(y1), r2=478(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 250
LDI r2, 478
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
