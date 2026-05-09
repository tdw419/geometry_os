; DESCRIPTION: Draws a yellow line from (327, 14) to (221, 112).
; PLAN: r0=327(x1), r1=14(y1), r2=221(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 14
LDI r2, 221
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
