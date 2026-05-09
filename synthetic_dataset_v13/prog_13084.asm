; DESCRIPTION: Places a black line segment connecting (40, 69) to (374, 227).
; PLAN: r0=40(x1), r1=69(y1), r2=374(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 69
LDI r2, 374
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
