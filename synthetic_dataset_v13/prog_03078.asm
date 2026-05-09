; DESCRIPTION: Draws a blue line from (116, 56) to (192, 24).
; PLAN: r0=116(x1), r1=56(y1), r2=192(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 56
LDI r2, 192
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
