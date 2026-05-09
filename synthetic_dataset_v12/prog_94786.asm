; DESCRIPTION: Places a purple line segment connecting (328, 53) to (176, 244).
; PLAN: r0=328(x1), r1=53(y1), r2=176(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 53
LDI r2, 176
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
