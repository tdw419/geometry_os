; DESCRIPTION: Places a blue line segment connecting (227, 98) to (464, 98).
; PLAN: r0=227(x1), r1=98(y1), r2=464(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 98
LDI r2, 464
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
