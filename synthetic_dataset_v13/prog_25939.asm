; DESCRIPTION: Composite: Creates a black rectangular region at (283, 124) spanning 105 by 89 pixels then Draws a blue circle centered at (42, 24) with radius 17 then Sets a single cyan pixel at (48, 244).
; PLAN: r0=283(x), r1=124(y), r2=105(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=24(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=48(x), r11=244(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 124
LDI r2, 105
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 24
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 48
LDI r11, 244
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
