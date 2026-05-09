; DESCRIPTION: Composite: Places a yellow 115x103 rectangle at position (136, 11) then Places a blue circle of radius 76 at center (393, 127) then Sets a single purple pixel at (287, 224).
; PLAN: r0=136(x), r1=11(y), r2=115(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x), r6=127(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x), r11=224(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 11
LDI r2, 115
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 127
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 224
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
