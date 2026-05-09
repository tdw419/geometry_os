; DESCRIPTION: Composite: Draws a white rectangle at (45, 81) with width 83 and height 82 then Draws a red circle centered at (85, 72) with radius 66 then Sets a single orange pixel at (209, 126).
; PLAN: r0=45(x), r1=81(y), r2=83(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=72(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=209(x), r11=126(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 81
LDI r2, 83
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 72
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 209
LDI r11, 126
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
