; DESCRIPTION: Composite: Sets a single yellow pixel at (122, 241) then Creates a orange circular shape at (262, 108) with radius 75 then Places a green 117x87 rectangle at position (355, 88).
; PLAN: r0=122(x), r1=241(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=262(x), r6=108(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=88(y), r12=117(width), r13=87(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 241
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 262
LDI r6, 108
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 88
LDI r12, 117
LDI r13, 87
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
