; DESCRIPTION: Composite: Draws a black rectangle at (131, 42) with width 93 and height 58 then Renders a purple disk with center (331, 114) and radius 42 then Sets a single red pixel at (271, 138).
; PLAN: r0=131(x), r1=42(y), r2=93(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=114(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=138(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 42
LDI r2, 93
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 114
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 138
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
