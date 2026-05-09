; DESCRIPTION: Composite: Draws a yellow line from (331, 219) to (238, 199) then Places a white dot at position (486, 170).
; PLAN: r0=331(x1), r1=219(y1), r2=238(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=170(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 219
LDI r2, 238
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 170
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
