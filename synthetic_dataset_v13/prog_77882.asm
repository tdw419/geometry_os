; DESCRIPTION: Places a purple line segment connecting (183, 122) to (319, 28).
; PLAN: r0=183(x1), r1=122(y1), r2=319(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 122
LDI r2, 319
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
