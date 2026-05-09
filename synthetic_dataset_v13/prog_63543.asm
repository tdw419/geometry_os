; DESCRIPTION: Places a purple line segment connecting (11, 176) to (210, 170).
; PLAN: r0=11(x1), r1=176(y1), r2=210(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 176
LDI r2, 210
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
