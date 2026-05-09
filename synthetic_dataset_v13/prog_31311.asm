; DESCRIPTION: Places a purple line segment connecting (30, 167) to (491, 164).
; PLAN: r0=30(x1), r1=167(y1), r2=491(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 167
LDI r2, 491
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
