; DESCRIPTION: Draws a white line from (327, 90) to (351, 106).
; PLAN: r0=327(x1), r1=90(y1), r2=351(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 90
LDI r2, 351
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
