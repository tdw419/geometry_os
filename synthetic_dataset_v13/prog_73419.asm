; DESCRIPTION: Composite: Renders a white disk with center (347, 150) and radius 80 then Draws a orange rectangle at (303, 4) with width 48 and height 63 then Sets a single green pixel at (447, 199).
; PLAN: r0=347(x), r1=150(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x), r6=4(y), r7=48(width), r8=63(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x), r11=199(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 150
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 4
LDI r7, 48
LDI r8, 63
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 199
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
