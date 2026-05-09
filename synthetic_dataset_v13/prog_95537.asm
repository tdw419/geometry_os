; DESCRIPTION: Composite: Draws a black rectangle at (306, 159) with width 74 and height 86 then Places a cyan dot at position (16, 36).
; PLAN: r0=306(x), r1=159(y), r2=74(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=36(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 159
LDI r2, 74
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 36
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
