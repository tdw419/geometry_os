; DESCRIPTION: Composite: Draws a purple rectangle at (358, 19) with width 99 and height 61 then Places a black dot at position (137, 39).
; PLAN: r0=358(x), r1=19(y), r2=99(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=39(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 19
LDI r2, 99
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 39
LDI r7, 0x000000
PSET r5, r6, r7
HALT
