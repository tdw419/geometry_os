; DESCRIPTION: Composite: Draws a black rectangle at (26, 75) with width 110 and height 50 then Draws a orange circle centered at (228, 184) with radius 25 then Places a magenta dot at position (263, 39).
; PLAN: r0=26(x), r1=75(y), r2=110(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=184(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x), r11=39(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 26
LDI r1, 75
LDI r2, 110
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 184
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 39
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
