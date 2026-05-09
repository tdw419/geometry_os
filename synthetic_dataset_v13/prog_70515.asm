; DESCRIPTION: Composite: Creates a orange circular shape at (329, 64) with radius 14 then Places a white 85x118 rectangle at position (327, 77) then Sets a single black pixel at (356, 62).
; PLAN: r0=329(x), r1=64(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=77(y), r7=85(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=62(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 64
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 77
LDI r7, 85
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 62
LDI r12, 0x000000
PSET r10, r11, r12
HALT
