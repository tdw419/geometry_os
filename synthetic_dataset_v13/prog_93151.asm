; DESCRIPTION: Creates a red circular shape at (268, 91) with radius 32.
; PLAN: r0=268(x), r1=91(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 91
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
