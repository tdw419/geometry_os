; DESCRIPTION: Places a purple line segment connecting (469, 164) to (281, 106).
; PLAN: r0=469(x1), r1=164(y1), r2=281(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 164
LDI r2, 281
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
