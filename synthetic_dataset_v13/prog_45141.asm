; DESCRIPTION: Places a purple line segment connecting (223, 188) to (269, 11).
; PLAN: r0=223(x1), r1=188(y1), r2=269(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 188
LDI r2, 269
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
