; DESCRIPTION: Renders a blue line between points (453, 247) and (157, 23).
; PLAN: r0=453(x1), r1=247(y1), r2=157(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 247
LDI r2, 157
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
