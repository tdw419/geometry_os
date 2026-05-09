; DESCRIPTION: Composite: Draws a cyan rectangle at (195, 2) with width 21 and height 85 then Draws a red circle centered at (381, 95) with radius 66 then Places a blue dot at position (131, 27).
; PLAN: r0=195(x), r1=2(y), r2=21(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=95(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x), r11=27(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 2
LDI r2, 21
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 95
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 27
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
