; DESCRIPTION: Renders a blue line between points (349, 112) and (441, 45).
; PLAN: r0=349(x1), r1=112(y1), r2=441(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 112
LDI r2, 441
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
