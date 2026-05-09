; DESCRIPTION: Places a purple line segment connecting (237, 159) to (17, 9).
; PLAN: r0=237(x1), r1=159(y1), r2=17(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 159
LDI r2, 17
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
