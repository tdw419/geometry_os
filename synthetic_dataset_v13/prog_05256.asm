; DESCRIPTION: Places a purple line segment connecting (177, 181) to (26, 43).
; PLAN: r0=177(x1), r1=181(y1), r2=26(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 181
LDI r2, 26
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
