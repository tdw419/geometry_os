; DESCRIPTION: Creates a red circular shape at (287, 64) with radius 13.
; PLAN: r0=287(x), r1=64(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 64
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
