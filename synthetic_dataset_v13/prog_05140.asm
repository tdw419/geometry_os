; DESCRIPTION: Composite: Renders a yellow box of size 93x39 starting at (17, 147) then Creates a white circular shape at (178, 138) with radius 66 then Sets a single black pixel at (325, 173).
; PLAN: r0=17(x), r1=147(y), r2=93(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=138(y), r7=66(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=325(x), r11=173(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 17
LDI r1, 147
LDI r2, 93
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 138
LDI r7, 66
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 325
LDI r11, 173
LDI r12, 0x000000
PSET r10, r11, r12
HALT
