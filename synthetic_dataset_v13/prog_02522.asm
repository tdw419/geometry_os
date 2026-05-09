; DESCRIPTION: Composite: Creates a yellow rectangular region at (257, 32) spanning 92 by 37 pixels then Sets a single magenta pixel at (205, 159) then Places a red circle of radius 36 at center (312, 56).
; PLAN: r0=257(x), r1=32(y), r2=92(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=159(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=56(y), r12=36(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 32
LDI r2, 92
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 159
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 312
LDI r11, 56
LDI r12, 36
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
