; DESCRIPTION: Composite: Draws a green line from (486, 222) to (36, 173) then Sets a single green pixel at (144, 49).
; PLAN: r0=486(x1), r1=222(y1), r2=36(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=49(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 486
LDI r1, 222
LDI r2, 36
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 49
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
