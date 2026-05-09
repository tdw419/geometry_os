; DESCRIPTION: Composite: Draws a white rectangle at (16, 88) with width 111 and height 85 then Places a orange dot at position (319, 211).
; PLAN: r0=16(x), r1=88(y), r2=111(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=211(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 16
LDI r1, 88
LDI r2, 111
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 211
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
