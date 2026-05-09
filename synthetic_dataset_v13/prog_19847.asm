; DESCRIPTION: Places a blue line segment connecting (141, 56) to (73, 239).
; PLAN: r0=141(x1), r1=56(y1), r2=73(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 56
LDI r2, 73
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
