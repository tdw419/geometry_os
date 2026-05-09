; DESCRIPTION: Draws a yellow line from (158, 116) to (391, 183).
; PLAN: r0=158(x1), r1=116(y1), r2=391(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 116
LDI r2, 391
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
