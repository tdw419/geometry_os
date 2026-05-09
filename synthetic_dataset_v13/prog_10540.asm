; DESCRIPTION: Renders a black line between points (183, 235) and (497, 159).
; PLAN: r0=183(x1), r1=235(y1), r2=497(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 235
LDI r2, 497
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
