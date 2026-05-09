; DESCRIPTION: Draws a black line from (293, 238) to (97, 5).
; PLAN: r0=293(x1), r1=238(y1), r2=97(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 238
LDI r2, 97
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
