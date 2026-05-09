; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (411, 131) then Draws a white rectangle at (178, 88) with width 68 and height 107 then Sets a single yellow pixel at (454, 191).
; PLAN: r0=411(x), r1=131(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=88(y), r7=68(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=191(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 131
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 88
LDI r7, 68
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 191
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
