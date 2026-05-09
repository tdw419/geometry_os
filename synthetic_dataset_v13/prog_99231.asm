; DESCRIPTION: Composite: Sets a single yellow pixel at (412, 245) then Places a black 23x31 rectangle at position (225, 63) then Creates a white circular shape at (75, 164) with radius 29.
; PLAN: r0=412(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=63(y), r7=23(width), r8=31(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x), r11=164(y), r12=29(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 245
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 225
LDI r6, 63
LDI r7, 23
LDI r8, 31
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 164
LDI r12, 29
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
