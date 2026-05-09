; DESCRIPTION: Draws a white line from (478, 106) to (296, 61).
; PLAN: r0=478(x1), r1=106(y1), r2=296(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 106
LDI r2, 296
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
