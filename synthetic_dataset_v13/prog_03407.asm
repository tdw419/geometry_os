; DESCRIPTION: Places a black line segment connecting (25, 172) to (72, 9).
; PLAN: r0=25(x1), r1=172(y1), r2=72(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 172
LDI r2, 72
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
