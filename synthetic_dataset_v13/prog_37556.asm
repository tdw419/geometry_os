; DESCRIPTION: Composite: Sets a single blue pixel at (376, 166) then Places a yellow circle of radius 28 at center (345, 145) then Creates a cyan rectangular region at (159, 189) spanning 47 by 10 pixels.
; PLAN: r0=376(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=145(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x), r11=189(y), r12=47(width), r13=10(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 345
LDI r6, 145
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 189
LDI r12, 47
LDI r13, 10
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
