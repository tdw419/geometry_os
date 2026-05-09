; DESCRIPTION: Composite: Places a white dot at position (314, 101) then Creates a black circular shape at (356, 82) with radius 23 then Places a purple 16x69 rectangle at position (210, 142).
; PLAN: r0=314(x), r1=101(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=82(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x), r11=142(y), r12=16(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 101
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 82
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 142
LDI r12, 16
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
