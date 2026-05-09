; DESCRIPTION: Composite: Draws a purple rectangle at (275, 76) with width 115 and height 87 then Places a purple dot at position (120, 23).
; PLAN: r0=275(x), r1=76(y), r2=115(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 76
LDI r2, 115
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
