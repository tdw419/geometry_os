; DESCRIPTION: Composite: Draws a orange rectangle at (90, 13) with width 71 and height 101 then Places a white dot at position (17, 126).
; PLAN: r0=90(x), r1=13(y), r2=71(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=17(x), r6=126(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 13
LDI r2, 71
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 126
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
