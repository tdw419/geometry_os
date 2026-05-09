; DESCRIPTION: Composite: Places a orange dot at position (343, 211) then Draws a white circle centered at (117, 160) with radius 57 then Places a purple 11x31 rectangle at position (194, 153).
; PLAN: r0=343(x), r1=211(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=160(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=153(y), r12=11(width), r13=31(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 343
LDI r1, 211
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 117
LDI r6, 160
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 153
LDI r12, 11
LDI r13, 31
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
