; DESCRIPTION: Composite: Places a blue 94x93 rectangle at position (412, 92) then Creates a orange circular shape at (481, 123) with radius 20 then Sets a single purple pixel at (40, 154).
; PLAN: r0=412(x), r1=92(y), r2=94(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=123(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=154(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 92
LDI r2, 94
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 123
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 154
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
