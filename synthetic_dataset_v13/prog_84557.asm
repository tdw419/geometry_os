; DESCRIPTION: Creates a red circular shape at (259, 178) with radius 64.
; PLAN: r0=259(x), r1=178(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 178
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
