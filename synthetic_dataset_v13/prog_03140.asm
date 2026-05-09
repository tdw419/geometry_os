; DESCRIPTION: Composite: Draws a red rectangle at (186, 57) with width 81 and height 89 then Places a green dot at position (241, 203).
; PLAN: r0=186(x), r1=57(y), r2=81(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=203(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 186
LDI r1, 57
LDI r2, 81
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 203
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
