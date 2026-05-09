; DESCRIPTION: Composite: Sets a single magenta pixel at (127, 53) then Creates a cyan circular shape at (53, 45) with radius 23 then Draws a blue rectangle at (258, 153) with width 117 and height 86.
; PLAN: r0=127(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=45(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=153(y), r12=117(width), r13=86(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 45
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 153
LDI r12, 117
LDI r13, 86
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
