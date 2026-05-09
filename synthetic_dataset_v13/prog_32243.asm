; DESCRIPTION: Composite: Creates a magenta circular shape at (376, 126) with radius 78 then Places a green dot at position (431, 126).
; PLAN: r0=376(x), r1=126(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=126(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 126
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 126
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
