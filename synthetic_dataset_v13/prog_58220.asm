; DESCRIPTION: Composite: Renders a black box of size 120x79 starting at (57, 19) then Places a orange dot at position (496, 183).
; PLAN: r0=57(x), r1=19(y), r2=120(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=183(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 19
LDI r2, 120
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 183
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
