; DESCRIPTION: Places a purple line segment connecting (301, 153) to (209, 183).
; PLAN: r0=301(x1), r1=153(y1), r2=209(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 153
LDI r2, 209
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
