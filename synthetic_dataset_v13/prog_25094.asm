; DESCRIPTION: Composite: Draws a magenta rectangle at (279, 122) with width 98 and height 13 then Places a white dot at position (230, 194).
; PLAN: r0=279(x), r1=122(y), r2=98(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=194(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 122
LDI r2, 98
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 194
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
