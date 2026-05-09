; DESCRIPTION: Creates a green circular shape at (413, 163) with radius 39.
; PLAN: r0=413(x), r1=163(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 163
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
