; DESCRIPTION: Renders a blue line between points (322, 20) and (253, 91).
; PLAN: r0=322(x1), r1=20(y1), r2=253(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 20
LDI r2, 253
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
