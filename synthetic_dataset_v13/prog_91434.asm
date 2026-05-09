; DESCRIPTION: Composite: Places a purple circle of radius 44 at center (205, 98) then Sets a single yellow pixel at (455, 73) then Places a green 120x57 rectangle at position (328, 131).
; PLAN: r0=205(x), r1=98(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=73(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=328(x), r11=131(y), r12=120(width), r13=57(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 98
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 73
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 328
LDI r11, 131
LDI r12, 120
LDI r13, 57
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
