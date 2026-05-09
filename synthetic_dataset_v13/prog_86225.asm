; DESCRIPTION: Draws a black line from (118, 139) to (344, 156).
; PLAN: r0=118(x1), r1=139(y1), r2=344(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 139
LDI r2, 344
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
