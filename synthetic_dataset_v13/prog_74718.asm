; DESCRIPTION: Composite: Creates a yellow rectangular region at (420, 184) spanning 22 by 18 pixels then Places a black circle of radius 42 at center (56, 115) then Sets a single blue pixel at (464, 102).
; PLAN: r0=420(x), r1=184(y), r2=22(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=115(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=464(x), r11=102(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 420
LDI r1, 184
LDI r2, 22
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 115
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 464
LDI r11, 102
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
