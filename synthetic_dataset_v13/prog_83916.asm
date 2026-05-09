; DESCRIPTION: Composite: Creates a green rectangular region at (410, 84) spanning 20 by 75 pixels then Creates a blue circular shape at (93, 67) with radius 63 then Places a magenta dot at position (496, 68).
; PLAN: r0=410(x), r1=84(y), r2=20(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=67(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x), r11=68(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 410
LDI r1, 84
LDI r2, 20
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 67
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 68
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
