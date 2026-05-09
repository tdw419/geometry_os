; DESCRIPTION: Composite: Draws a magenta rectangle at (47, 91) with width 74 and height 117 then Places a white dot at position (315, 90).
; PLAN: r0=47(x), r1=91(y), r2=74(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=90(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 91
LDI r2, 74
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 90
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
