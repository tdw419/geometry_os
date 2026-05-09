; DESCRIPTION: Places a purple line segment connecting (12, 231) to (43, 204).
; PLAN: r0=12(x1), r1=231(y1), r2=43(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 231
LDI r2, 43
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
