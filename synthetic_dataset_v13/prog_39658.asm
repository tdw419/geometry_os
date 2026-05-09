; DESCRIPTION: Composite: Creates a cyan rectangular region at (19, 125) spanning 25 by 31 pixels then Draws a white circle centered at (495, 157) with radius 13 then Places a magenta dot at position (232, 97).
; PLAN: r0=19(x), r1=125(y), r2=25(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=157(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=232(x), r11=97(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 19
LDI r1, 125
LDI r2, 25
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 157
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 232
LDI r11, 97
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
