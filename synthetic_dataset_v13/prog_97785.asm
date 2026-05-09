; DESCRIPTION: Places a purple line segment connecting (204, 206) to (143, 129).
; PLAN: r0=204(x1), r1=206(y1), r2=143(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 206
LDI r2, 143
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
