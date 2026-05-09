; DESCRIPTION: Places a blue line segment connecting (359, 49) to (386, 203).
; PLAN: r0=359(x1), r1=49(y1), r2=386(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 49
LDI r2, 386
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
