; DESCRIPTION: Draws a black circle centered at (414, 46) with radius 42.
; PLAN: r0=414(x), r1=46(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 46
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
