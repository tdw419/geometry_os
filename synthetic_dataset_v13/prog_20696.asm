; DESCRIPTION: Draws a white line from (418, 235) to (189, 35).
; PLAN: r0=418(x1), r1=235(y1), r2=189(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 235
LDI r2, 189
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
