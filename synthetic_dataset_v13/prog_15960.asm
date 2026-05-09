; DESCRIPTION: Places a black line segment connecting (244, 162) to (361, 39).
; PLAN: r0=244(x1), r1=162(y1), r2=361(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 162
LDI r2, 361
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
