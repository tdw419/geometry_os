; DESCRIPTION: Places a black line segment connecting (476, 98) to (345, 122).
; PLAN: r0=476(x1), r1=98(y1), r2=345(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 98
LDI r2, 345
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
