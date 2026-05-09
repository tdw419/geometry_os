; DESCRIPTION: Places a black line segment connecting (33, 88) to (285, 103).
; PLAN: r0=33(x1), r1=88(y1), r2=285(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 88
LDI r2, 285
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
