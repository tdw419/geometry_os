; DESCRIPTION: Draws a white line from (293, 14) to (323, 100).
; PLAN: r0=293(x1), r1=14(y1), r2=323(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 14
LDI r2, 323
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
