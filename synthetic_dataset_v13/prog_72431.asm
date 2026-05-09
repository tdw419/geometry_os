; DESCRIPTION: Renders a blue line between points (511, 41) and (478, 209).
; PLAN: r0=511(x1), r1=41(y1), r2=478(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 41
LDI r2, 478
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
