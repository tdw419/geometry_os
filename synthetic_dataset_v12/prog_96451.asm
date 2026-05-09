; DESCRIPTION: Composite: Draws a cyan rectangle at (146, 109) with width 43 and height 89 then Places a cyan dot at position (35, 185).
; PLAN: r0=146(x), r1=109(y), r2=43(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=185(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 109
LDI r2, 43
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 185
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
