; DESCRIPTION: Composite: Renders a orange disk with center (163, 123) and radius 79 then Creates a white rectangular region at (19, 12) spanning 23 by 47 pixels then Sets a single cyan pixel at (354, 138).
; PLAN: r0=163(x), r1=123(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x), r6=12(y), r7=23(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=138(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 123
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 12
LDI r7, 23
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 138
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
