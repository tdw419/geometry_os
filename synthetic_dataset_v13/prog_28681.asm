; DESCRIPTION: Places a black line segment connecting (505, 165) to (469, 212).
; PLAN: r0=505(x1), r1=165(y1), r2=469(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 165
LDI r2, 469
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
