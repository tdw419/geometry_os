; DESCRIPTION: Renders a blue line between points (195, 156) and (491, 71).
; PLAN: r0=195(x1), r1=156(y1), r2=491(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 156
LDI r2, 491
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
