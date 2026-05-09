; DESCRIPTION: Creates a yellow circular shape at (98, 194) with radius 32.
; PLAN: r0=98(x), r1=194(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 194
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
