; DESCRIPTION: Places a purple line segment connecting (269, 187) to (381, 181).
; PLAN: r0=269(x1), r1=187(y1), r2=381(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 187
LDI r2, 381
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
