; DESCRIPTION: Places a blue line segment connecting (270, 198) to (277, 11).
; PLAN: r0=270(x1), r1=198(y1), r2=277(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 198
LDI r2, 277
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
