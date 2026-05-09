; DESCRIPTION: Draws a black line from (93, 227) to (293, 30).
; PLAN: r0=93(x1), r1=227(y1), r2=293(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 227
LDI r2, 293
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
