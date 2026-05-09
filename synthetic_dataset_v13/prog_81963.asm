; DESCRIPTION: Composite: Places a red 108x76 rectangle at position (11, 173) then Places a white circle of radius 46 at center (335, 66) then Sets a single red pixel at (161, 31).
; PLAN: r0=11(x), r1=173(y), r2=108(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=66(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=31(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 173
LDI r2, 108
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 66
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 31
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
