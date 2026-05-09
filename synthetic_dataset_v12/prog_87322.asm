; DESCRIPTION: Composite: Places a green 59x108 rectangle at position (391, 99) then Places a white circle of radius 27 at center (376, 175) then Places a purple dot at position (257, 176).
; PLAN: r0=391(x), r1=99(y), r2=59(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=175(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=176(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 99
LDI r2, 59
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 175
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 176
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
