; DESCRIPTION: Composite: Draws a blue circle centered at (323, 83) with radius 30 then Places a black dot at position (306, 228).
; PLAN: r0=323(x), r1=83(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=228(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 83
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 228
LDI r7, 0x000000
PSET r5, r6, r7
HALT
