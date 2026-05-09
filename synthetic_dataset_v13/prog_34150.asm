; DESCRIPTION: Places a blue line segment connecting (234, 220) to (462, 90).
; PLAN: r0=234(x1), r1=220(y1), r2=462(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 220
LDI r2, 462
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
