; DESCRIPTION: Draws a black line from (288, 185) to (137, 118).
; PLAN: r0=288(x1), r1=185(y1), r2=137(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 185
LDI r2, 137
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
