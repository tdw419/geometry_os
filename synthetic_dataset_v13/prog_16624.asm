; DESCRIPTION: Places a black line segment connecting (24, 2) to (492, 1).
; PLAN: r0=24(x1), r1=2(y1), r2=492(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 2
LDI r2, 492
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
