; DESCRIPTION: Renders a blue line between points (388, 58) and (8, 51).
; PLAN: r0=388(x1), r1=58(y1), r2=8(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 58
LDI r2, 8
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
