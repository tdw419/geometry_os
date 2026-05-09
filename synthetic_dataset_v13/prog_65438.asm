; DESCRIPTION: Places a purple line segment connecting (139, 43) to (394, 159).
; PLAN: r0=139(x1), r1=43(y1), r2=394(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 43
LDI r2, 394
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
