; DESCRIPTION: Composite: Creates a purple rectangular region at (14, 99) spanning 91 by 33 pixels then Creates a yellow circular shape at (78, 125) with radius 71 then Places a magenta dot at position (186, 186).
; PLAN: r0=14(x), r1=99(y), r2=91(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=125(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=186(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 14
LDI r1, 99
LDI r2, 91
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 125
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 186
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
