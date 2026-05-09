; DESCRIPTION: Places a black line segment connecting (272, 64) to (421, 188).
; PLAN: r0=272(x1), r1=64(y1), r2=421(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 64
LDI r2, 421
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
