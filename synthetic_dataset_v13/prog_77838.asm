; DESCRIPTION: Composite: Places a orange 43x57 rectangle at position (375, 36) then Places a orange dot at position (511, 232).
; PLAN: r0=375(x), r1=36(y), r2=43(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=511(x), r6=232(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 36
LDI r2, 43
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 232
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
