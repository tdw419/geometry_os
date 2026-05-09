; DESCRIPTION: Draws a purple line from (149, 36) to (107, 28).
; PLAN: r0=149(x1), r1=36(y1), r2=107(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 36
LDI r2, 107
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
