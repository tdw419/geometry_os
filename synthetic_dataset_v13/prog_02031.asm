; DESCRIPTION: Composite: Draws a orange line from (386, 150) to (58, 235) then Sets a single magenta pixel at (251, 83).
; PLAN: r0=386(x1), r1=150(y1), r2=58(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=83(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 386
LDI r1, 150
LDI r2, 58
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 83
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
