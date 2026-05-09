; DESCRIPTION: Composite: Draws a cyan rectangle at (422, 118) with width 81 and height 86 then Sets a single red pixel at (338, 101).
; PLAN: r0=422(x), r1=118(y), r2=81(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 118
LDI r2, 81
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
