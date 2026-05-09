; DESCRIPTION: Composite: Draws a white line from (249, 57) to (257, 25) then Sets a single blue pixel at (468, 181).
; PLAN: r0=249(x1), r1=57(y1), r2=257(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=468(x), r6=181(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 57
LDI r2, 257
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 181
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
