; DESCRIPTION: Composite: Places a cyan dot at position (376, 144) then Creates a purple circular shape at (189, 138) with radius 24 then Places a green 107x17 rectangle at position (94, 43).
; PLAN: r0=376(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=138(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=94(x), r11=43(y), r12=107(width), r13=17(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 138
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 94
LDI r11, 43
LDI r12, 107
LDI r13, 17
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
