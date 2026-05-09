; DESCRIPTION: Places a black line segment connecting (409, 102) to (371, 71).
; PLAN: r0=409(x1), r1=102(y1), r2=371(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 102
LDI r2, 371
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
