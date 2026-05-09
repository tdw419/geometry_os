; DESCRIPTION: Draws a black line from (293, 51) to (211, 15).
; PLAN: r0=293(x1), r1=51(y1), r2=211(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 51
LDI r2, 211
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
