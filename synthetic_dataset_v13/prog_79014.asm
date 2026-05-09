; DESCRIPTION: Composite: Creates a cyan circular shape at (304, 56) with radius 55 then Sets a single orange pixel at (218, 19) then Draws a white rectangle at (236, 30) with width 83 and height 32.
; PLAN: r0=304(x), r1=56(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=236(x), r11=30(y), r12=83(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 56
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 236
LDI r11, 30
LDI r12, 83
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
