; DESCRIPTION: Draws a yellow line from (493, 160) to (227, 112).
; PLAN: r0=493(x1), r1=160(y1), r2=227(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 160
LDI r2, 227
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
