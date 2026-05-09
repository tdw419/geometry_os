; DESCRIPTION: Renders a blue line between points (412, 72) and (226, 137).
; PLAN: r0=412(x1), r1=72(y1), r2=226(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 72
LDI r2, 226
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
