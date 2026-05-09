; DESCRIPTION: Places a black line segment connecting (477, 204) to (25, 22).
; PLAN: r0=477(x1), r1=204(y1), r2=25(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 204
LDI r2, 25
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
