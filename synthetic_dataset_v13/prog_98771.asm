; DESCRIPTION: Creates a magenta circular shape at (115, 241) with radius 13.
; PLAN: r0=115(x), r1=241(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 241
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
