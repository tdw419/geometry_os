; DESCRIPTION: Draws a white line from (477, 29) to (199, 188).
; PLAN: r0=477(x1), r1=29(y1), r2=199(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 29
LDI r2, 199
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
