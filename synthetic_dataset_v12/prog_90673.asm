; DESCRIPTION: Composite: Places a black 55x85 rectangle at position (199, 5) then Draws a red circle centered at (314, 154) with radius 66 then Sets a single orange pixel at (381, 250).
; PLAN: r0=199(x), r1=5(y), r2=55(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=154(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=250(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 5
LDI r2, 55
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 154
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 250
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
