; DESCRIPTION: Composite: Renders a magenta box of size 52x74 starting at (288, 100) then Sets a single magenta pixel at (141, 97) then Creates a green circular shape at (354, 225) with radius 23.
; PLAN: r0=288(x), r1=100(y), r2=52(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=97(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=354(x), r11=225(y), r12=23(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 100
LDI r2, 52
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 97
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 354
LDI r11, 225
LDI r12, 23
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
