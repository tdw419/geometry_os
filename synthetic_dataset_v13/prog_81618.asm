; DESCRIPTION: Places a black line segment connecting (14, 219) to (437, 189).
; PLAN: r0=14(x1), r1=219(y1), r2=437(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 219
LDI r2, 437
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
