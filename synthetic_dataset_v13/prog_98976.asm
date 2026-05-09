; DESCRIPTION: Composite: Draws a white rectangle at (217, 52) with width 119 and height 75 then Places a white dot at position (319, 214).
; PLAN: r0=217(x), r1=52(y), r2=119(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=214(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 52
LDI r2, 119
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 214
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
