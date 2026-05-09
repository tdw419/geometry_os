; DESCRIPTION: Draws a white line from (81, 147) to (437, 244).
; PLAN: r0=81(x1), r1=147(y1), r2=437(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 147
LDI r2, 437
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
