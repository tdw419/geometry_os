; DESCRIPTION: Places a black line segment connecting (0, 204) to (436, 208).
; PLAN: r0=0(x1), r1=204(y1), r2=436(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 204
LDI r2, 436
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
