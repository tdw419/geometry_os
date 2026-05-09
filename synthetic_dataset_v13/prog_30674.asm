; DESCRIPTION: Places a blue line segment connecting (450, 100) to (453, 175).
; PLAN: r0=450(x1), r1=100(y1), r2=453(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 100
LDI r2, 453
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
