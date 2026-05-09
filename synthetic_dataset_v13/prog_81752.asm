; DESCRIPTION: Places a purple line segment connecting (19, 210) to (172, 176).
; PLAN: r0=19(x1), r1=210(y1), r2=172(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 210
LDI r2, 172
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
