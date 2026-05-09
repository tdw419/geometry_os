; DESCRIPTION: Composite: Creates a white circular shape at (312, 134) with radius 60 then Draws a blue rectangle at (15, 60) with width 89 and height 46 then Places a purple dot at position (309, 242).
; PLAN: r0=312(x), r1=134(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=60(y), r7=89(width), r8=46(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=242(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 312
LDI r1, 134
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 60
LDI r7, 89
LDI r8, 46
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 242
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
