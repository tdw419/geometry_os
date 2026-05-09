; DESCRIPTION: Composite: Creates a cyan circular shape at (461, 109) with radius 28 then Sets a single yellow pixel at (4, 179) then Places a white 55x88 rectangle at position (239, 147).
; PLAN: r0=461(x), r1=109(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=179(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=239(x), r11=147(y), r12=55(width), r13=88(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 109
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 179
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 239
LDI r11, 147
LDI r12, 55
LDI r13, 88
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
