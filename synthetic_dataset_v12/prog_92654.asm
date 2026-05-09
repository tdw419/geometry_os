; DESCRIPTION: Places a black line segment connecting (89, 103) to (476, 69).
; PLAN: r0=89(x1), r1=103(y1), r2=476(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 103
LDI r2, 476
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
