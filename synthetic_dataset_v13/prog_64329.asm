; DESCRIPTION: Renders a blue line between points (510, 232) and (382, 79).
; PLAN: r0=510(x1), r1=232(y1), r2=382(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 232
LDI r2, 382
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
