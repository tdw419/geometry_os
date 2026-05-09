; DESCRIPTION: Draws a red line from (155, 26) to (307, 100).
; PLAN: r0=155(x1), r1=26(y1), r2=307(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 26
LDI r2, 307
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
