; DESCRIPTION: Draws a yellow line from (118, 157) to (411, 56).
; PLAN: r0=118(x1), r1=157(y1), r2=411(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 157
LDI r2, 411
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
