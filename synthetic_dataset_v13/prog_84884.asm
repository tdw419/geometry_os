; DESCRIPTION: Composite: Places a purple 103x108 rectangle at position (49, 74) then Sets a single blue pixel at (234, 61) then Places a cyan circle of radius 71 at center (281, 110).
; PLAN: r0=49(x), r1=74(y), r2=103(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=61(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=110(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 74
LDI r2, 103
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 61
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 110
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
