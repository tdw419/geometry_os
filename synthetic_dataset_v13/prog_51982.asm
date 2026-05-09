; DESCRIPTION: Composite: Places a white 65x63 rectangle at position (417, 165) then Creates a black circular shape at (434, 103) with radius 27 then Places a magenta dot at position (381, 61).
; PLAN: r0=417(x), r1=165(y), r2=65(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=103(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=381(x), r11=61(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 417
LDI r1, 165
LDI r2, 65
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 103
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 381
LDI r11, 61
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
