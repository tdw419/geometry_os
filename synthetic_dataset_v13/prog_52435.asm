; DESCRIPTION: Draws a black circle centered at (276, 205) with radius 32.
; PLAN: r0=276(x), r1=205(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 205
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
