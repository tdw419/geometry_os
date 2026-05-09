; DESCRIPTION: Places a green line segment connecting (427, 55) to (179, 34).
; PLAN: r0=427(x1), r1=55(y1), r2=179(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 55
LDI r2, 179
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
