; DESCRIPTION: Creates a red circular shape at (247, 64) with radius 56.
; PLAN: r0=247(x), r1=64(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 64
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
