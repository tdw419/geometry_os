; DESCRIPTION: Composite: Creates a white circular shape at (115, 152) with radius 19 then Places a black 42x101 rectangle at position (391, 42) then Sets a single blue pixel at (394, 186).
; PLAN: r0=115(x), r1=152(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=42(y), r7=42(width), r8=101(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=186(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 115
LDI r1, 152
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 42
LDI r7, 42
LDI r8, 101
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 186
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
