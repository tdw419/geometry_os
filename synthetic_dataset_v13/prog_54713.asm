; DESCRIPTION: Draws a green line from (141, 35) to (323, 185).
; PLAN: r0=141(x1), r1=35(y1), r2=323(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 35
LDI r2, 323
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
