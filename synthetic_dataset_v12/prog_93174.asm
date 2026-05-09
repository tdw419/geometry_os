; DESCRIPTION: Places a orange line segment connecting (333, 172) to (227, 66).
; PLAN: r0=333(x1), r1=172(y1), r2=227(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 172
LDI r2, 227
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
