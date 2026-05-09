; DESCRIPTION: Composite: Places a green line segment connecting (84, 138) to (139, 216) then Sets a single yellow pixel at (165, 238) then Places a black 19x26 rectangle at position (127, 65).
; PLAN: r0=84(x1), r1=138(y1), r2=139(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=65(y), r12=19(width), r13=26(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 138
LDI r2, 139
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 127
LDI r11, 65
LDI r12, 19
LDI r13, 26
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
