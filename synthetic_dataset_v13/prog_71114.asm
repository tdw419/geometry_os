; DESCRIPTION: Draws a white line from (419, 201) to (251, 194).
; PLAN: r0=419(x1), r1=201(y1), r2=251(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 201
LDI r2, 251
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
