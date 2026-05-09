; DESCRIPTION: Composite: Draws a cyan rectangle at (115, 13) with width 83 and height 30 then Renders a blue disk with center (225, 125) and radius 48 then Sets a single black pixel at (281, 98).
; PLAN: r0=115(x), r1=13(y), r2=83(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=125(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=98(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 115
LDI r1, 13
LDI r2, 83
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 125
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 98
LDI r12, 0x000000
PSET r10, r11, r12
HALT
