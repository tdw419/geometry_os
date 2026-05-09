; DESCRIPTION: Places a black line segment connecting (246, 52) to (232, 128).
; PLAN: r0=246(x1), r1=52(y1), r2=232(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 52
LDI r2, 232
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
