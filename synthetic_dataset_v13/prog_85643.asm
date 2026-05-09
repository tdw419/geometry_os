; DESCRIPTION: Composite: Draws a purple circle centered at (266, 192) with radius 61 then Creates a green rectangular region at (385, 79) spanning 85 by 119 pixels.
; PLAN: r0=266(x), r1=192(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=79(y), r7=85(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 266
LDI r1, 192
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 79
LDI r7, 85
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
