; DESCRIPTION: Composite: Sets a single orange pixel at (461, 49) then Renders a black box of size 77x105 starting at (33, 23) then Renders a magenta disk with center (155, 113) and radius 29.
; PLAN: r0=461(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=23(y), r7=77(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=113(y), r12=29(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 461
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 33
LDI r6, 23
LDI r7, 77
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 113
LDI r12, 29
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
