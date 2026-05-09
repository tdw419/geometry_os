; DESCRIPTION: Composite: Draws a cyan rectangle at (337, 42) with width 90 and height 43 then Sets a single green pixel at (312, 217).
; PLAN: r0=337(x), r1=42(y), r2=90(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=217(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 337
LDI r1, 42
LDI r2, 90
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 217
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
