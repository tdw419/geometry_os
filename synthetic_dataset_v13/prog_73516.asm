; DESCRIPTION: Composite: Draws a red rectangle at (205, 138) with width 41 and height 114 then Creates a purple circular shape at (186, 103) with radius 57 then Places a red dot at position (289, 72).
; PLAN: r0=205(x), r1=138(y), r2=41(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=103(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=289(x), r11=72(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 138
LDI r2, 41
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 103
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 289
LDI r11, 72
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
