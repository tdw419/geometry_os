; DESCRIPTION: Composite: Draws a white circle centered at (132, 85) with radius 80 then Creates a blue rectangular region at (346, 37) spanning 76 by 43 pixels then Places a yellow dot at position (174, 199).
; PLAN: r0=132(x), r1=85(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=37(y), r7=76(width), r8=43(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x), r11=199(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 85
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 37
LDI r7, 76
LDI r8, 43
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 199
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
