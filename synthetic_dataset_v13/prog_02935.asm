; DESCRIPTION: Composite: Draws a orange rectangle at (391, 154) with width 75 and height 81 then Sets a single yellow pixel at (112, 9).
; PLAN: r0=391(x), r1=154(y), r2=75(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=9(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 154
LDI r2, 75
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 9
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
