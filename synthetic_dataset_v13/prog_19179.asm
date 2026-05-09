; DESCRIPTION: Composite: Creates a cyan rectangular region at (196, 87) spanning 59 by 87 pixels then Places a yellow circle of radius 69 at center (163, 113) then Sets a single red pixel at (155, 78).
; PLAN: r0=196(x), r1=87(y), r2=59(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=113(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=78(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 87
LDI r2, 59
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 113
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 78
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
