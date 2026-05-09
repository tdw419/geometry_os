; DESCRIPTION: Places a black line segment connecting (179, 17) to (489, 134).
; PLAN: r0=179(x1), r1=17(y1), r2=489(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 17
LDI r2, 489
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
