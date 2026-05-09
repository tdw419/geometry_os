; DESCRIPTION: Composite: Draws a cyan rectangle at (341, 13) with width 10 and height 45 then Places a red dot at position (11, 7).
; PLAN: r0=341(x), r1=13(y), r2=10(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 13
LDI r2, 10
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
