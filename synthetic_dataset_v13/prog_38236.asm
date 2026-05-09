; DESCRIPTION: Places a blue line segment connecting (223, 23) to (406, 69).
; PLAN: r0=223(x1), r1=23(y1), r2=406(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 23
LDI r2, 406
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
