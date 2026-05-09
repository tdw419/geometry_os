; DESCRIPTION: Composite: Creates a cyan rectangular region at (355, 51) spanning 75 by 26 pixels then Places a white circle of radius 75 at center (173, 149) then Sets a single blue pixel at (161, 156).
; PLAN: r0=355(x), r1=51(y), r2=75(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x), r6=149(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=156(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 51
LDI r2, 75
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 149
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 156
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
