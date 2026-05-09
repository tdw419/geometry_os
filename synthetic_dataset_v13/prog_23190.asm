; DESCRIPTION: Draws a black line from (194, 170) to (344, 140).
; PLAN: r0=194(x1), r1=170(y1), r2=344(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 170
LDI r2, 344
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
