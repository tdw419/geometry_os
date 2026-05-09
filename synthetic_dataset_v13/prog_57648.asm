; DESCRIPTION: Renders a purple line between points (280, 17) and (200, 209).
; PLAN: r0=280(x1), r1=17(y1), r2=200(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 17
LDI r2, 200
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
