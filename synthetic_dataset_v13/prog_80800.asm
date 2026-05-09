; DESCRIPTION: Draws a white line from (235, 199) to (423, 35).
; PLAN: r0=235(x1), r1=199(y1), r2=423(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 199
LDI r2, 423
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
