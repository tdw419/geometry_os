; DESCRIPTION: Places a black line segment connecting (436, 69) to (409, 96).
; PLAN: r0=436(x1), r1=69(y1), r2=409(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 69
LDI r2, 409
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
