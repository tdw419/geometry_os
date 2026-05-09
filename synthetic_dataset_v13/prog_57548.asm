; DESCRIPTION: Composite: Places a cyan 56x92 rectangle at position (347, 128) then Sets a single black pixel at (42, 29) then Places a blue circle of radius 66 at center (182, 93).
; PLAN: r0=347(x), r1=128(y), r2=56(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=29(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=182(x), r11=93(y), r12=66(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 347
LDI r1, 128
LDI r2, 56
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 29
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 182
LDI r11, 93
LDI r12, 66
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
