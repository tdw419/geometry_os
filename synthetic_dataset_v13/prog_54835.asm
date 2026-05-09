; DESCRIPTION: Composite: Renders a orange disk with center (129, 57) and radius 49 then Draws a green rectangle at (24, 116) with width 61 and height 59 then Sets a single purple pixel at (472, 129).
; PLAN: r0=129(x), r1=57(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=116(y), r7=61(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=472(x), r11=129(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 57
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 116
LDI r7, 61
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 129
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
