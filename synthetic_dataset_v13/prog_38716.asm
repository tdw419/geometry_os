; DESCRIPTION: Composite: Draws a yellow rectangle at (368, 40) with width 36 and height 115 then Sets a single white pixel at (399, 56).
; PLAN: r0=368(x), r1=40(y), r2=36(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=399(x), r6=56(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 40
LDI r2, 36
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 56
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
