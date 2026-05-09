; DESCRIPTION: Composite: Renders a cyan disk with center (324, 84) and radius 75 then Draws a white rectangle at (348, 107) with width 17 and height 114 then Sets a single purple pixel at (375, 87).
; PLAN: r0=324(x), r1=84(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=107(y), r7=17(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=87(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 84
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 107
LDI r7, 17
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 87
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
