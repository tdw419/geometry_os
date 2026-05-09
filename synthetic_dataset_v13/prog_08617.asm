; DESCRIPTION: Creates a red circular shape at (383, 164) with radius 13.
; PLAN: r0=383(x), r1=164(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 164
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
