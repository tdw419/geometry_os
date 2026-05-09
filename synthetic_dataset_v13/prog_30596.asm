; DESCRIPTION: Draws a yellow line from (323, 2) to (129, 208).
; PLAN: r0=323(x1), r1=2(y1), r2=129(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 2
LDI r2, 129
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
