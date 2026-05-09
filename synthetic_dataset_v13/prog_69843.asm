; DESCRIPTION: Draws a yellow line from (119, 101) to (411, 109).
; PLAN: r0=119(x1), r1=101(y1), r2=411(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 101
LDI r2, 411
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
