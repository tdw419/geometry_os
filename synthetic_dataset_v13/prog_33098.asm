; DESCRIPTION: Composite: Creates a green rectangular region at (86, 79) spanning 21 by 85 pixels then Draws a orange circle centered at (456, 191) with radius 54 then Places a green dot at position (140, 191).
; PLAN: r0=86(x), r1=79(y), r2=21(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=191(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=191(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 86
LDI r1, 79
LDI r2, 21
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 191
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 191
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
