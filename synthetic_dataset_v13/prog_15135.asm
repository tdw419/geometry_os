; DESCRIPTION: Composite: Draws a orange line from (165, 186) to (418, 12) then Sets a single blue pixel at (367, 254).
; PLAN: r0=165(x1), r1=186(y1), r2=418(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=254(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 186
LDI r2, 418
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 254
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
