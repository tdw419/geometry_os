; DESCRIPTION: Draws a black line from (486, 140) to (159, 233).
; PLAN: r0=486(x1), r1=140(y1), r2=159(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 140
LDI r2, 159
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
