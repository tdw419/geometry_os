; DESCRIPTION: Composite: Draws a red rectangle at (91, 130) with width 19 and height 52 then Draws a blue circle centered at (393, 199) with radius 46 then Places a orange dot at position (443, 142).
; PLAN: r0=91(x), r1=130(y), r2=19(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=199(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x), r11=142(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 130
LDI r2, 19
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 199
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 142
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
