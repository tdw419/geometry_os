; DESCRIPTION: Places a blue line segment connecting (214, 94) to (385, 98).
; PLAN: r0=214(x1), r1=94(y1), r2=385(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 94
LDI r2, 385
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
