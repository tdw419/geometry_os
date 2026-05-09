; DESCRIPTION: Composite: Draws a orange circle centered at (407, 53) with radius 42 then Draws a green rectangle at (365, 107) with width 89 and height 32 then Sets a single blue pixel at (484, 103).
; PLAN: r0=407(x), r1=53(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=107(y), r7=89(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=103(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 53
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 107
LDI r7, 89
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 103
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
