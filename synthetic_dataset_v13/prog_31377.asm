; DESCRIPTION: Draws a white line from (174, 227) to (9, 118).
; PLAN: r0=174(x1), r1=227(y1), r2=9(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 227
LDI r2, 9
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
