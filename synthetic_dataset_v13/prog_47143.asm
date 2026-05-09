; DESCRIPTION: Places a blue line segment connecting (480, 253) to (250, 155).
; PLAN: r0=480(x1), r1=253(y1), r2=250(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 253
LDI r2, 250
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
