; DESCRIPTION: Composite: Draws a white rectangle at (452, 60) with width 57 and height 96 then Sets a single purple pixel at (190, 183).
; PLAN: r0=452(x), r1=60(y), r2=57(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=183(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 60
LDI r2, 57
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 183
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
