; DESCRIPTION: Composite: Places a black circle of radius 70 at center (308, 160) then Sets a single red pixel at (457, 58) then Places a green 45x47 rectangle at position (64, 116).
; PLAN: r0=308(x), r1=160(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=58(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=64(x), r11=116(y), r12=45(width), r13=47(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 160
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 58
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 64
LDI r11, 116
LDI r12, 45
LDI r13, 47
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
