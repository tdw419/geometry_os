; DESCRIPTION: Places a purple line segment connecting (1, 253) to (107, 52).
; PLAN: r0=1(x1), r1=253(y1), r2=107(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 253
LDI r2, 107
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
