; DESCRIPTION: Composite: Renders a orange disk with center (85, 175) and radius 54 then Creates a yellow rectangular region at (151, 38) spanning 35 by 84 pixels then Places a yellow dot at position (152, 165).
; PLAN: r0=85(x), r1=175(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=38(y), r7=35(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x), r11=165(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 175
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 38
LDI r7, 35
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 165
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
