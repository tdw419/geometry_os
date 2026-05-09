; DESCRIPTION: Composite: Places a yellow dot at position (149, 37) then Creates a cyan circular shape at (116, 126) with radius 14 then Places a black 27x17 rectangle at position (358, 23).
; PLAN: r0=149(x), r1=37(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=126(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x), r11=23(y), r12=27(width), r13=17(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 37
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 126
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 23
LDI r12, 27
LDI r13, 17
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
