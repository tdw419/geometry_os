; DESCRIPTION: Creates a white circular shape at (294, 112) with radius 75.
; PLAN: r0=294(x), r1=112(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 112
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
