; DESCRIPTION: Draws a yellow line from (15, 11) to (222, 51).
; PLAN: r0=15(x1), r1=11(y1), r2=222(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 11
LDI r2, 222
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
