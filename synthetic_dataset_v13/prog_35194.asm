; DESCRIPTION: Composite: Draws a magenta rectangle at (316, 71) with width 78 and height 95 then Places a yellow dot at position (306, 115).
; PLAN: r0=316(x), r1=71(y), r2=78(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 71
LDI r2, 78
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
