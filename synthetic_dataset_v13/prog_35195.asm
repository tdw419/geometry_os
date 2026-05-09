; DESCRIPTION: Composite: Draws a orange rectangle at (276, 96) with width 26 and height 74 then Places a magenta dot at position (0, 117) then Renders a green disk with center (383, 156) and radius 41.
; PLAN: r0=276(x), r1=96(y), r2=26(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=0(x), r6=117(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=383(x), r11=156(y), r12=41(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 96
LDI r2, 26
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 117
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 383
LDI r11, 156
LDI r12, 41
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
