; DESCRIPTION: Composite: Sets a single orange pixel at (187, 49) then Places a white 119x119 rectangle at position (223, 117) then Draws a blue circle centered at (63, 26) with radius 15.
; PLAN: r0=187(x), r1=49(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=117(y), r7=119(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x), r11=26(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 49
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 223
LDI r6, 117
LDI r7, 119
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 26
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
