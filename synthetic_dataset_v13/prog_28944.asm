; DESCRIPTION: Composite: Draws a black rectangle at (136, 197) with width 78 and height 37 then Places a purple dot at position (420, 126).
; PLAN: r0=136(x), r1=197(y), r2=78(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x), r6=126(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 197
LDI r2, 78
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 126
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
