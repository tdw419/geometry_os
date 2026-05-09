; DESCRIPTION: Places a black line segment connecting (167, 232) to (160, 128).
; PLAN: r0=167(x1), r1=232(y1), r2=160(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 232
LDI r2, 160
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
