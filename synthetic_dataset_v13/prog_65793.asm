; DESCRIPTION: Draws a purple line from (474, 53) to (211, 62).
; PLAN: r0=474(x1), r1=53(y1), r2=211(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 53
LDI r2, 211
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
