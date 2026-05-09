; DESCRIPTION: Composite: Creates a yellow rectangular region at (258, 184) spanning 101 by 44 pixels then Sets a single blue pixel at (502, 221) then Places a black circle of radius 63 at center (185, 126).
; PLAN: r0=258(x), r1=184(y), r2=101(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=502(x), r6=221(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=185(x), r11=126(y), r12=63(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 184
LDI r2, 101
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 221
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 185
LDI r11, 126
LDI r12, 63
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
