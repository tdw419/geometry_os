; DESCRIPTION: Renders a blue line between points (51, 249) and (274, 148).
; PLAN: r0=51(x1), r1=249(y1), r2=274(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 249
LDI r2, 274
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
