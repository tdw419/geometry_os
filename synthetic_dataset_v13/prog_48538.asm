; DESCRIPTION: Creates a white circular shape at (111, 126) with radius 25.
; PLAN: r0=111(x), r1=126(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 126
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
