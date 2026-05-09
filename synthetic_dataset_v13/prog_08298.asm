; DESCRIPTION: Composite: Draws a magenta rectangle at (462, 202) with width 15 and height 33 then Places a green dot at position (432, 176).
; PLAN: r0=462(x), r1=202(y), r2=15(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=176(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 202
LDI r2, 15
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 176
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
