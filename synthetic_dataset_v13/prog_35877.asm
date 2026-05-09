; DESCRIPTION: Creates a red circular shape at (321, 128) with radius 28.
; PLAN: r0=321(x), r1=128(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 128
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
