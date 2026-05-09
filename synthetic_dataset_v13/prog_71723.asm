; DESCRIPTION: Composite: Draws a black rectangle at (5, 81) with width 107 and height 39 then Sets a single yellow pixel at (36, 41).
; PLAN: r0=5(x), r1=81(y), r2=107(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=41(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 81
LDI r2, 107
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 41
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
