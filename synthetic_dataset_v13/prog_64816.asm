; DESCRIPTION: Places a black line segment connecting (128, 246) to (389, 162).
; PLAN: r0=128(x1), r1=246(y1), r2=389(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 246
LDI r2, 389
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
