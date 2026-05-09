; DESCRIPTION: Places a black line segment connecting (364, 18) to (409, 189).
; PLAN: r0=364(x1), r1=18(y1), r2=409(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 18
LDI r2, 409
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
