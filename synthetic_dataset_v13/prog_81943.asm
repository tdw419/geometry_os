; DESCRIPTION: Composite: Renders a purple box of size 15x91 starting at (329, 106) then Sets a single blue pixel at (211, 104) then Places a white circle of radius 17 at center (431, 83).
; PLAN: r0=329(x), r1=106(y), r2=15(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=211(x), r6=104(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=83(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 106
LDI r2, 15
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 104
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 83
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
