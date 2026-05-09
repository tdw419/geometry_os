; DESCRIPTION: Draws a purple line from (324, 195) to (153, 22).
; PLAN: r0=324(x1), r1=195(y1), r2=153(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 195
LDI r2, 153
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
