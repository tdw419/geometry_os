; DESCRIPTION: Composite: Draws a purple rectangle at (282, 45) with width 93 and height 10 then Places a orange dot at position (405, 99).
; PLAN: r0=282(x), r1=45(y), r2=93(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=99(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 45
LDI r2, 93
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 99
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
