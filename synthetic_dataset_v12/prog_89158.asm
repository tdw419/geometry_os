; DESCRIPTION: Composite: Creates a cyan circular shape at (154, 176) with radius 30 then Sets a single black pixel at (132, 247) then Places a orange 64x88 rectangle at position (163, 143).
; PLAN: r0=154(x), r1=176(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=247(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=143(y), r12=64(width), r13=88(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 176
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 247
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 163
LDI r11, 143
LDI r12, 64
LDI r13, 88
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
