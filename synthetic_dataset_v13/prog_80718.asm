; DESCRIPTION: Composite: Draws a purple circle centered at (93, 136) with radius 48 then Draws a magenta line from (426, 12) to (497, 241).
; PLAN: r0=93(x), r1=136(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=12(y1), r7=497(x2), r8=241(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 136
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 12
LDI r7, 497
LDI r8, 241
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
