; DESCRIPTION: Places a purple line segment connecting (43, 157) to (82, 198).
; PLAN: r0=43(x1), r1=157(y1), r2=82(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 157
LDI r2, 82
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
