; DESCRIPTION: Draws a black line from (159, 97) to (278, 51).
; PLAN: r0=159(x1), r1=97(y1), r2=278(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 97
LDI r2, 278
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
