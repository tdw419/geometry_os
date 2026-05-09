; DESCRIPTION: Draws a red line from (141, 170) to (130, 189).
; PLAN: r0=141(x1), r1=170(y1), r2=130(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 170
LDI r2, 130
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
