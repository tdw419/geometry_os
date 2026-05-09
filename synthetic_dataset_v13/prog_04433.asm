; DESCRIPTION: Places a blue line segment connecting (314, 29) to (464, 165).
; PLAN: r0=314(x1), r1=29(y1), r2=464(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 29
LDI r2, 464
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
