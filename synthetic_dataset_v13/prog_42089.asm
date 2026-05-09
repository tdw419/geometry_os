; DESCRIPTION: Creates a yellow circular shape at (276, 85) with radius 63.
; PLAN: r0=276(x), r1=85(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 85
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
