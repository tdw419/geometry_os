; DESCRIPTION: Composite: Draws a green rectangle at (0, 107) with width 86 and height 103 then Draws a white circle centered at (289, 97) with radius 64 then Sets a single cyan pixel at (141, 131).
; PLAN: r0=0(x), r1=107(y), r2=86(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=97(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=131(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 0
LDI r1, 107
LDI r2, 86
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 97
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 131
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
