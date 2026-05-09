; DESCRIPTION: Composite: Draws a orange circle centered at (360, 150) with radius 55 then Creates a white rectangular region at (98, 58) spanning 14 by 76 pixels then Sets a single purple pixel at (207, 255).
; PLAN: r0=360(x), r1=150(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=58(y), r7=14(width), r8=76(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=255(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 150
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 58
LDI r7, 14
LDI r8, 76
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 255
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
