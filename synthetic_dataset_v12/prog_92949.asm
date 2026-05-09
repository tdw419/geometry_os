; DESCRIPTION: Composite: Places a black dot at position (70, 76) then Creates a black circular shape at (355, 236) with radius 16 then Places a purple 53x32 rectangle at position (173, 68).
; PLAN: r0=70(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=236(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=68(y), r12=53(width), r13=32(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 355
LDI r6, 236
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 68
LDI r12, 53
LDI r13, 32
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
