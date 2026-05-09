; DESCRIPTION: Creates a white circular shape at (51, 228) with radius 20.
; PLAN: r0=51(x), r1=228(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 228
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
