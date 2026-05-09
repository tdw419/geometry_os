; DESCRIPTION: Places a blue line segment connecting (493, 69) to (13, 3).
; PLAN: r0=493(x1), r1=69(y1), r2=13(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 69
LDI r2, 13
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
