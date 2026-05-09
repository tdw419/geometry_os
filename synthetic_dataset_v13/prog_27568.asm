; DESCRIPTION: Places a black line segment connecting (39, 160) to (457, 149).
; PLAN: r0=39(x1), r1=160(y1), r2=457(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 160
LDI r2, 457
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
