; DESCRIPTION: Draws a white line from (199, 6) to (230, 232).
; PLAN: r0=199(x1), r1=6(y1), r2=230(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 6
LDI r2, 230
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
