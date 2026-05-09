; DESCRIPTION: Places a purple line segment connecting (72, 41) to (415, 179).
; PLAN: r0=72(x1), r1=41(y1), r2=415(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 41
LDI r2, 415
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
