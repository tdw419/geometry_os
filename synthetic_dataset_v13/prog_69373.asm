; DESCRIPTION: Composite: Sets a single blue pixel at (346, 251) then Draws a purple line from (492, 102) to (183, 115).
; PLAN: r0=346(x), r1=251(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=102(y1), r7=183(x2), r8=115(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 251
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 492
LDI r6, 102
LDI r7, 183
LDI r8, 115
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
