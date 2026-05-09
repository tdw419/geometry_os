; DESCRIPTION: Draws a yellow line from (391, 131) to (194, 229).
; PLAN: r0=391(x1), r1=131(y1), r2=194(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 131
LDI r2, 194
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
