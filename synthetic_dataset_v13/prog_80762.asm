; DESCRIPTION: Composite: Sets a single magenta pixel at (271, 170) then Creates a blue circular shape at (399, 143) with radius 57 then Places a magenta 88x74 rectangle at position (396, 76).
; PLAN: r0=271(x), r1=170(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=399(x), r6=143(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=76(y), r12=88(width), r13=74(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 170
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 399
LDI r6, 143
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 76
LDI r12, 88
LDI r13, 74
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
