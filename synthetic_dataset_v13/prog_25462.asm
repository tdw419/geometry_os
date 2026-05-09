; DESCRIPTION: Draws a orange line from (130, 235) to (498, 199).
; PLAN: r0=130(x1), r1=235(y1), r2=498(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 235
LDI r2, 498
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
