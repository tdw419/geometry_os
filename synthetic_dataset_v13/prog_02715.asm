; DESCRIPTION: Draws a yellow line from (287, 11) to (105, 233).
; PLAN: r0=287(x1), r1=11(y1), r2=105(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 11
LDI r2, 105
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
