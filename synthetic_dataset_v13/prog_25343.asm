; DESCRIPTION: Draws a white line from (207, 77) to (411, 147).
; PLAN: r0=207(x1), r1=77(y1), r2=411(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 77
LDI r2, 411
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
