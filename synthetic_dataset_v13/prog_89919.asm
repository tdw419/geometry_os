; DESCRIPTION: Composite: Draws a cyan rectangle at (413, 5) with width 72 and height 39 then Places a yellow dot at position (118, 63).
; PLAN: r0=413(x), r1=5(y), r2=72(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=63(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 5
LDI r2, 72
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 63
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
