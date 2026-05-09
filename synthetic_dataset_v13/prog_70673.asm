; DESCRIPTION: Places a orange line segment connecting (456, 132) to (246, 49).
; PLAN: r0=456(x1), r1=132(y1), r2=246(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 132
LDI r2, 246
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
