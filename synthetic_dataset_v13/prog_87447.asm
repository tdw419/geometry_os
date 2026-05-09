; DESCRIPTION: Composite: Creates a magenta rectangular region at (396, 3) spanning 105 by 89 pixels then Draws a magenta circle centered at (240, 87) with radius 78 then Sets a single green pixel at (146, 19).
; PLAN: r0=396(x), r1=3(y), r2=105(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=87(y), r7=78(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=19(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 3
LDI r2, 105
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 87
LDI r7, 78
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 19
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
