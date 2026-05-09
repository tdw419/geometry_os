; DESCRIPTION: Renders a purple line between points (382, 51) and (62, 91).
; PLAN: r0=382(x1), r1=51(y1), r2=62(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 51
LDI r2, 62
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
