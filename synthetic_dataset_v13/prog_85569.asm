; DESCRIPTION: Composite: Places a white circle of radius 23 at center (205, 191) then Creates a magenta rectangular region at (451, 100) spanning 45 by 61 pixels then Places a white dot at position (432, 181).
; PLAN: r0=205(x), r1=191(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=451(x), r6=100(y), r7=45(width), r8=61(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=432(x), r11=181(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 191
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 451
LDI r6, 100
LDI r7, 45
LDI r8, 61
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 432
LDI r11, 181
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
