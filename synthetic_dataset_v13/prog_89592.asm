; DESCRIPTION: Creates a red circular shape at (331, 151) with radius 57.
; PLAN: r0=331(x), r1=151(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 151
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
