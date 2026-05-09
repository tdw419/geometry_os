; DESCRIPTION: Composite: Places a blue circle of radius 29 at center (181, 39) then Sets a single orange pixel at (3, 34) then Places a purple 42x104 rectangle at position (158, 48).
; PLAN: r0=181(x), r1=39(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=34(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=48(y), r12=42(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 39
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 34
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 158
LDI r11, 48
LDI r12, 42
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
