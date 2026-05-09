; DESCRIPTION: Composite: Places a cyan 59x101 rectangle at position (199, 140) then Sets a single white pixel at (109, 121) then Draws a purple circle centered at (211, 94) with radius 52.
; PLAN: r0=199(x), r1=140(y), r2=59(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=94(y), r12=52(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 140
LDI r2, 59
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 211
LDI r11, 94
LDI r12, 52
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
