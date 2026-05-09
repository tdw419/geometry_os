; DESCRIPTION: Composite: Places a cyan circle of radius 63 at center (118, 93) then Sets a single magenta pixel at (123, 92) then Draws a green rectangle at (264, 134) with width 46 and height 110.
; PLAN: r0=118(x), r1=93(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=92(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=264(x), r11=134(y), r12=46(width), r13=110(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 93
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 92
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 264
LDI r11, 134
LDI r12, 46
LDI r13, 110
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
