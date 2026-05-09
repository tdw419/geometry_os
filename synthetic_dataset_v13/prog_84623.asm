; DESCRIPTION: Composite: Draws a magenta line from (325, 251) to (373, 173) then Sets a single red pixel at (230, 11).
; PLAN: r0=325(x1), r1=251(y1), r2=373(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=11(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 251
LDI r2, 373
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 11
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
