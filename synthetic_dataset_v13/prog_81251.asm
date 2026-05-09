; DESCRIPTION: Places a yellow line segment connecting (55, 212) to (436, 53).
; PLAN: r0=55(x1), r1=212(y1), r2=436(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 212
LDI r2, 436
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
