; DESCRIPTION: Renders a blue line between points (426, 112) and (385, 137).
; PLAN: r0=426(x1), r1=112(y1), r2=385(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 112
LDI r2, 385
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
