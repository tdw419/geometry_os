; DESCRIPTION: Composite: Creates a green rectangular region at (72, 36) spanning 26 by 116 pixels then Draws a green circle centered at (270, 197) with radius 27 then Places a white dot at position (212, 63).
; PLAN: r0=72(x), r1=36(y), r2=26(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=197(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=63(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 36
LDI r2, 26
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 197
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 63
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
