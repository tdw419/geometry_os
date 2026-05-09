; DESCRIPTION: Renders a blue line between points (508, 130) and (414, 155).
; PLAN: r0=508(x1), r1=130(y1), r2=414(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 130
LDI r2, 414
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
