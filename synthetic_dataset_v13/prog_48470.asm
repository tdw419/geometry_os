; DESCRIPTION: Composite: Places a red 106x108 rectangle at position (118, 75) then Sets a single red pixel at (316, 248).
; PLAN: r0=118(x), r1=75(y), r2=106(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 75
LDI r2, 106
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
