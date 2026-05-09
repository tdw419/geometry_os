; DESCRIPTION: Composite: Draws a black rectangle at (404, 9) with width 24 and height 79 then Places a black dot at position (483, 254).
; PLAN: r0=404(x), r1=9(y), r2=24(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x), r6=254(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 404
LDI r1, 9
LDI r2, 24
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 254
LDI r7, 0x000000
PSET r5, r6, r7
HALT
