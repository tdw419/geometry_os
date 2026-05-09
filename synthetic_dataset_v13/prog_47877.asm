; DESCRIPTION: Draws a white line from (69, 147) to (134, 176).
; PLAN: r0=69(x1), r1=147(y1), r2=134(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 147
LDI r2, 134
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
