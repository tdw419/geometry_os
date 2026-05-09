; DESCRIPTION: Draws a black line from (288, 112) to (390, 156).
; PLAN: r0=288(x1), r1=112(y1), r2=390(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 112
LDI r2, 390
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
