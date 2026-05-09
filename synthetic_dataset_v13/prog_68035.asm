; DESCRIPTION: Draws a yellow line from (26, 140) to (102, 188).
; PLAN: r0=26(x1), r1=140(y1), r2=102(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 140
LDI r2, 102
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
