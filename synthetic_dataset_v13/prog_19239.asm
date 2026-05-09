; DESCRIPTION: Places a black line segment connecting (366, 14) to (128, 27).
; PLAN: r0=366(x1), r1=14(y1), r2=128(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 14
LDI r2, 128
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
