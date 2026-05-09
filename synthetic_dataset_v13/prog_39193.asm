; DESCRIPTION: Draws a yellow line from (323, 35) to (33, 123).
; PLAN: r0=323(x1), r1=35(y1), r2=33(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 35
LDI r2, 33
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
