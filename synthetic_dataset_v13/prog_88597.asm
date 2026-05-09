; DESCRIPTION: Composite: Draws a red circle centered at (159, 171) with radius 58 then Creates a white rectangular region at (371, 90) spanning 110 by 100 pixels then Places a white dot at position (239, 21).
; PLAN: r0=159(x), r1=171(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=90(y), r7=110(width), r8=100(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=21(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 171
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 90
LDI r7, 110
LDI r8, 100
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 21
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
