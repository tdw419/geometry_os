; DESCRIPTION: Composite: Draws a magenta rectangle at (105, 31) with width 52 and height 41 then Places a black circle of radius 11 at center (461, 193) then Places a green dot at position (105, 175).
; PLAN: r0=105(x), r1=31(y), r2=52(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=193(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x), r11=175(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 31
LDI r2, 52
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 193
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 175
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
