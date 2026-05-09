; DESCRIPTION: Composite: Draws a blue line from (17, 6) to (167, 5) then Sets a single black pixel at (418, 50).
; PLAN: r0=17(x1), r1=6(y1), r2=167(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=50(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 17
LDI r1, 6
LDI r2, 167
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 50
LDI r7, 0x000000
PSET r5, r6, r7
HALT
