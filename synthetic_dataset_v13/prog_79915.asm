; DESCRIPTION: Places a blue line segment connecting (270, 160) to (130, 233).
; PLAN: r0=270(x1), r1=160(y1), r2=130(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 160
LDI r2, 130
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
