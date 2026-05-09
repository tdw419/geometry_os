; DESCRIPTION: Composite: Draws a green rectangle at (290, 77) with width 81 and height 118 then Sets a single white pixel at (352, 140).
; PLAN: r0=290(x), r1=77(y), r2=81(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=140(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 77
LDI r2, 81
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 140
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
