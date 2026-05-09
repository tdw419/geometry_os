; DESCRIPTION: Composite: Draws a black circle centered at (286, 188) with radius 21 then Draws a black rectangle at (342, 66) with width 45 and height 34 then Places a magenta dot at position (265, 75).
; PLAN: r0=286(x), r1=188(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=66(y), r7=45(width), r8=34(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=265(x), r11=75(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 188
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 66
LDI r7, 45
LDI r8, 34
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 75
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
