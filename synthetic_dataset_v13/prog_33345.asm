; DESCRIPTION: Places a blue line segment connecting (310, 220) to (163, 43).
; PLAN: r0=310(x1), r1=220(y1), r2=163(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 220
LDI r2, 163
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
