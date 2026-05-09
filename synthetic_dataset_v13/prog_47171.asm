; DESCRIPTION: Composite: Places a blue dot at position (285, 128) then Draws a green circle centered at (75, 156) with radius 30 then Draws a yellow rectangle at (334, 117) with width 25 and height 31.
; PLAN: r0=285(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=156(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=117(y), r12=25(width), r13=31(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 156
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 117
LDI r12, 25
LDI r13, 31
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
