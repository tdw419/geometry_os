; DESCRIPTION: Composite: Draws a purple rectangle at (270, 95) with width 95 and height 13 then Places a black dot at position (444, 252).
; PLAN: r0=270(x), r1=95(y), r2=95(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=252(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 95
LDI r2, 95
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 252
LDI r7, 0x000000
PSET r5, r6, r7
HALT
