; DESCRIPTION: Composite: Draws a blue circle centered at (425, 114) with radius 31 then Draws a green rectangle at (227, 203) with width 97 and height 39 then Sets a single white pixel at (439, 235).
; PLAN: r0=425(x), r1=114(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=203(y), r7=97(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x), r11=235(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 114
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 203
LDI r7, 97
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 235
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
