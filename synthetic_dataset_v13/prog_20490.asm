; DESCRIPTION: Composite: Places a purple dot at position (51, 93) then Draws a black rectangle at (336, 42) with width 26 and height 37.
; PLAN: r0=51(x), r1=93(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=42(y), r7=26(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 93
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 42
LDI r7, 26
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
