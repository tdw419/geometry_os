; DESCRIPTION: Places a blue line segment connecting (130, 72) to (310, 185).
; PLAN: r0=130(x1), r1=72(y1), r2=310(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 72
LDI r2, 310
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
