; DESCRIPTION: Places a purple line segment connecting (418, 176) to (472, 246).
; PLAN: r0=418(x1), r1=176(y1), r2=472(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 176
LDI r2, 472
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
