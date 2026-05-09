; DESCRIPTION: Composite: Renders a magenta disk with center (35, 113) and radius 21 then Draws a magenta rectangle at (461, 151) with width 31 and height 72 then Places a orange dot at position (4, 201).
; PLAN: r0=35(x), r1=113(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=151(y), r7=31(width), r8=72(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x), r11=201(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 113
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 151
LDI r7, 31
LDI r8, 72
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 201
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
