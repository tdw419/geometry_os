; DESCRIPTION: Draws a purple line from (343, 24) to (374, 16).
; PLAN: r0=343(x1), r1=24(y1), r2=374(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 24
LDI r2, 374
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
