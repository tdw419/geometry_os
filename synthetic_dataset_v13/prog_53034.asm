; DESCRIPTION: Places a blue line segment connecting (155, 114) to (506, 209).
; PLAN: r0=155(x1), r1=114(y1), r2=506(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 114
LDI r2, 506
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
