; DESCRIPTION: Composite: Draws a green rectangle at (280, 63) with width 63 and height 85 then Places a purple dot at position (490, 4).
; PLAN: r0=280(x), r1=63(y), r2=63(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=4(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 63
LDI r2, 63
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 4
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
