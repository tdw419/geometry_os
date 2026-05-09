; DESCRIPTION: Composite: Draws a orange line from (235, 51) to (279, 55) then Sets a single black pixel at (113, 148).
; PLAN: r0=235(x1), r1=51(y1), r2=279(x2), r3=55(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=148(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 51
LDI r2, 279
LDI r3, 55
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 148
LDI r7, 0x000000
PSET r5, r6, r7
HALT
