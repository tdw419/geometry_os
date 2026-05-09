; DESCRIPTION: Places a blue line segment connecting (122, 90) to (53, 222).
; PLAN: r0=122(x1), r1=90(y1), r2=53(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 90
LDI r2, 53
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
