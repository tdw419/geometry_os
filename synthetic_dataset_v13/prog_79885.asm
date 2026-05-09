; DESCRIPTION: Composite: Places a purple circle of radius 23 at center (293, 198) then Places a green 17x93 rectangle at position (177, 38) then Sets a single purple pixel at (484, 29).
; PLAN: r0=293(x), r1=198(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=38(y), r7=17(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=29(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 198
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 38
LDI r7, 17
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 29
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
