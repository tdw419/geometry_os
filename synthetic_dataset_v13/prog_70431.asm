; DESCRIPTION: Places a black line segment connecting (399, 67) to (118, 244).
; PLAN: r0=399(x1), r1=67(y1), r2=118(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 67
LDI r2, 118
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
