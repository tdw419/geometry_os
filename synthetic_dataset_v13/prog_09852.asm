; DESCRIPTION: Composite: Creates a black circular shape at (163, 164) with radius 61 then Draws a purple line from (419, 196) to (82, 246) then Sets a single magenta pixel at (496, 246).
; PLAN: r0=163(x), r1=164(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x1), r6=196(y1), r7=82(x2), r8=246(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=246(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 164
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 196
LDI r7, 82
LDI r8, 246
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 246
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
