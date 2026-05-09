; DESCRIPTION: Composite: Places a white 64x78 rectangle at position (220, 17) then Places a white dot at position (32, 86) then Creates a blue circular shape at (443, 143) with radius 36.
; PLAN: r0=220(x), r1=17(y), r2=64(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x), r6=86(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=143(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 17
LDI r2, 64
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 86
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 443
LDI r11, 143
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
