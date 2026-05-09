; DESCRIPTION: Draws a purple line from (223, 96) to (374, 250).
; PLAN: r0=223(x1), r1=96(y1), r2=374(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 96
LDI r2, 374
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
