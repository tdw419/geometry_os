; DESCRIPTION: Composite: Places a cyan dot at position (281, 255) then Creates a white circular shape at (463, 86) with radius 34 then Creates a white rectangular region at (425, 159) spanning 45 by 64 pixels.
; PLAN: r0=281(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=86(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x), r11=159(y), r12=45(width), r13=64(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 463
LDI r6, 86
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 159
LDI r12, 45
LDI r13, 64
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
