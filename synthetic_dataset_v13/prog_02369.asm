; DESCRIPTION: Composite: Places a yellow line segment connecting (421, 156) to (455, 222) then Places a green dot at position (272, 75) then Draws a white circle centered at (128, 142) with radius 56.
; PLAN: r0=421(x1), r1=156(y1), r2=455(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=75(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=128(x), r11=142(y), r12=56(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 156
LDI r2, 455
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 75
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 128
LDI r11, 142
LDI r12, 56
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
