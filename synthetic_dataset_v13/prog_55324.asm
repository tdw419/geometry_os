; DESCRIPTION: Composite: Places a green circle of radius 58 at center (376, 130) then Draws a green rectangle at (484, 225) with width 24 and height 13 then Sets a single cyan pixel at (511, 184).
; PLAN: r0=376(x), r1=130(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x), r6=225(y), r7=24(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=511(x), r11=184(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 130
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 225
LDI r7, 24
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 511
LDI r11, 184
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
