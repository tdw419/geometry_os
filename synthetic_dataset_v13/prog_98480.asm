; DESCRIPTION: Places a blue line segment connecting (188, 0) to (51, 160).
; PLAN: r0=188(x1), r1=0(y1), r2=51(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 0
LDI r2, 51
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
