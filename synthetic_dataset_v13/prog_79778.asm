; DESCRIPTION: Places a blue line segment connecting (29, 82) to (310, 110).
; PLAN: r0=29(x1), r1=82(y1), r2=310(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 82
LDI r2, 310
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
