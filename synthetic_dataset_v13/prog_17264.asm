; DESCRIPTION: Composite: Draws a orange line from (482, 34) to (90, 5) then Sets a single magenta pixel at (278, 159).
; PLAN: r0=482(x1), r1=34(y1), r2=90(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=159(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 34
LDI r2, 90
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 159
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
