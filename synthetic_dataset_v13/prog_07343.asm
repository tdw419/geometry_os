; DESCRIPTION: Places a black line segment connecting (31, 246) to (440, 101).
; PLAN: r0=31(x1), r1=246(y1), r2=440(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 246
LDI r2, 440
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
