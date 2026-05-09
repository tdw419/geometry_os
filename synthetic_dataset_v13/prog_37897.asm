; DESCRIPTION: Composite: Sets a single orange pixel at (304, 173) then Creates a cyan circular shape at (357, 194) with radius 53 then Places a white 17x64 rectangle at position (266, 92).
; PLAN: r0=304(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=194(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=266(x), r11=92(y), r12=17(width), r13=64(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 357
LDI r6, 194
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 266
LDI r11, 92
LDI r12, 17
LDI r13, 64
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
