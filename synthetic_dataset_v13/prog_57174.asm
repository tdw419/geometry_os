; DESCRIPTION: Composite: Creates a white rectangular region at (141, 2) spanning 90 by 78 pixels then Draws a orange circle centered at (160, 87) with radius 26 then Places a red dot at position (82, 99).
; PLAN: r0=141(x), r1=2(y), r2=90(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x), r6=87(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=82(x), r11=99(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 2
LDI r2, 90
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 87
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 82
LDI r11, 99
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
