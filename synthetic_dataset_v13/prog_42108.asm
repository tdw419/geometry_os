; DESCRIPTION: Draws a white line from (427, 118) to (406, 40).
; PLAN: r0=427(x1), r1=118(y1), r2=406(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 118
LDI r2, 406
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
