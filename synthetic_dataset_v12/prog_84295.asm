; DESCRIPTION: Creates a yellow circular shape at (418, 82) with radius 63.
; PLAN: r0=418(x), r1=82(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 82
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
