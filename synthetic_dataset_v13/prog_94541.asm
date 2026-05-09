; DESCRIPTION: Composite: Places a magenta circle of radius 63 at center (129, 83) then Creates a black rectangular region at (379, 94) spanning 87 by 84 pixels then Sets a single white pixel at (51, 223).
; PLAN: r0=129(x), r1=83(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=94(y), r7=87(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=51(x), r11=223(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 83
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 94
LDI r7, 87
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 223
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
