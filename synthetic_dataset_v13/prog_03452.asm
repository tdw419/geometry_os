; DESCRIPTION: Composite: Sets a single magenta pixel at (444, 161) then Creates a black circular shape at (390, 151) with radius 75 then Places a black 59x55 rectangle at position (267, 102).
; PLAN: r0=444(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=390(x), r6=151(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=267(x), r11=102(y), r12=59(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 390
LDI r6, 151
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 267
LDI r11, 102
LDI r12, 59
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
