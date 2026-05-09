; DESCRIPTION: Places a purple line segment connecting (113, 12) to (351, 244).
; PLAN: r0=113(x1), r1=12(y1), r2=351(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 12
LDI r2, 351
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
