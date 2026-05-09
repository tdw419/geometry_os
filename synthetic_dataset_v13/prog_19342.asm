; DESCRIPTION: Composite: Draws a green rectangle at (319, 94) with width 73 and height 54 then Places a red dot at position (165, 4).
; PLAN: r0=319(x), r1=94(y), r2=73(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=4(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 94
LDI r2, 73
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 4
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
