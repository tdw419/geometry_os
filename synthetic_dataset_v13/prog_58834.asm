; DESCRIPTION: Composite: Creates a blue rectangular region at (318, 19) spanning 63 by 29 pixels then Places a white circle of radius 78 at center (371, 109).
; PLAN: r0=318(x), r1=19(y), r2=63(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=109(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 318
LDI r1, 19
LDI r2, 63
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 109
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
