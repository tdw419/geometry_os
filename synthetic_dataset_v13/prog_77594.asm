; DESCRIPTION: Places a blue line segment connecting (312, 161) to (347, 57).
; PLAN: r0=312(x1), r1=161(y1), r2=347(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 161
LDI r2, 347
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
