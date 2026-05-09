; DESCRIPTION: Places a purple line segment connecting (336, 132) to (25, 107).
; PLAN: r0=336(x1), r1=132(y1), r2=25(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 132
LDI r2, 25
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
