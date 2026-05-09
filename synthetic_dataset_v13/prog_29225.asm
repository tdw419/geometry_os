; DESCRIPTION: Places a blue line segment connecting (113, 8) to (310, 13).
; PLAN: r0=113(x1), r1=8(y1), r2=310(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 8
LDI r2, 310
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
