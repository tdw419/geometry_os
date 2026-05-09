; DESCRIPTION: Composite: Draws a green rectangle at (136, 153) with width 58 and height 28 then Sets a single green pixel at (440, 99).
; PLAN: r0=136(x), r1=153(y), r2=58(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=99(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 153
LDI r2, 58
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 99
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
