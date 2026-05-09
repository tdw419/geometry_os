; DESCRIPTION: Composite: Places a black line segment connecting (258, 156) to (64, 2) then Places a purple dot at position (151, 69) then Draws a cyan circle centered at (24, 103) with radius 13.
; PLAN: r0=258(x1), r1=156(y1), r2=64(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=69(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=103(y), r12=13(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 156
LDI r2, 64
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 69
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 103
LDI r12, 13
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
