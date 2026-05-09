; DESCRIPTION: Composite: Draws a red rectangle at (44, 134) with width 116 and height 44 then Places a blue dot at position (261, 97).
; PLAN: r0=44(x), r1=134(y), r2=116(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=97(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 134
LDI r2, 116
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 97
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
