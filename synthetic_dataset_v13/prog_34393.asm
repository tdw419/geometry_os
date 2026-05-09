; DESCRIPTION: Composite: Draws a yellow rectangle at (81, 41) with width 85 and height 15 then Sets a single orange pixel at (204, 78).
; PLAN: r0=81(x), r1=41(y), r2=85(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=78(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 81
LDI r1, 41
LDI r2, 85
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 78
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
