; DESCRIPTION: Places a blue line segment connecting (19, 21) to (310, 212).
; PLAN: r0=19(x1), r1=21(y1), r2=310(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 21
LDI r2, 310
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
