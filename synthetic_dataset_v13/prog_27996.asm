; DESCRIPTION: Composite: Places a magenta dot at position (319, 42) then Draws a white rectangle at (178, 36) with width 94 and height 96 then Places a yellow circle of radius 29 at center (76, 105).
; PLAN: r0=319(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=36(y), r7=94(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x), r11=105(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 36
LDI r7, 94
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 105
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
