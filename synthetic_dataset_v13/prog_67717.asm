; DESCRIPTION: Draws a white line from (219, 227) to (486, 235).
; PLAN: r0=219(x1), r1=227(y1), r2=486(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 227
LDI r2, 486
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
