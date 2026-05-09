; DESCRIPTION: Places a black line segment connecting (271, 204) to (497, 45).
; PLAN: r0=271(x1), r1=204(y1), r2=497(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 204
LDI r2, 497
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
