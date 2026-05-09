; DESCRIPTION: Composite: Creates a yellow rectangular region at (185, 143) spanning 31 by 79 pixels then Draws a green circle centered at (422, 16) with radius 16 then Places a blue dot at position (485, 127).
; PLAN: r0=185(x), r1=143(y), r2=31(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=16(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=485(x), r11=127(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 143
LDI r2, 31
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 16
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 485
LDI r11, 127
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
