; DESCRIPTION: Places a blue line segment connecting (159, 23) to (55, 249).
; PLAN: r0=159(x1), r1=23(y1), r2=55(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 23
LDI r2, 55
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
