; DESCRIPTION: Composite: Draws a black rectangle at (456, 140) with width 52 and height 101 then Places a orange dot at position (263, 42).
; PLAN: r0=456(x), r1=140(y), r2=52(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=42(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 140
LDI r2, 52
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 42
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
