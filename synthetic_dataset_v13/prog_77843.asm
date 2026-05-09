; DESCRIPTION: Renders a blue line between points (441, 71) and (300, 135).
; PLAN: r0=441(x1), r1=71(y1), r2=300(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 71
LDI r2, 300
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
