; DESCRIPTION: Creates a red circular shape at (61, 223) with radius 18.
; PLAN: r0=61(x), r1=223(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 223
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
