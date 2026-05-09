; DESCRIPTION: Draws a white line from (472, 211) to (93, 54).
; PLAN: r0=472(x1), r1=211(y1), r2=93(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 211
LDI r2, 93
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
