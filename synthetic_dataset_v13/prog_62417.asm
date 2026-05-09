; DESCRIPTION: Draws a yellow line from (353, 110) to (491, 2).
; PLAN: r0=353(x1), r1=110(y1), r2=491(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 110
LDI r2, 491
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
