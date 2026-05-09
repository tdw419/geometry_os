; DESCRIPTION: Draws a purple line from (38, 116) to (136, 0).
; PLAN: r0=38(x1), r1=116(y1), r2=136(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 116
LDI r2, 136
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
