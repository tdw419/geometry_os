; DESCRIPTION: Renders a blue line between points (211, 130) and (508, 22).
; PLAN: r0=211(x1), r1=130(y1), r2=508(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 130
LDI r2, 508
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
