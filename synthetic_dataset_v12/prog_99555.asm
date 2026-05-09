; DESCRIPTION: Creates a white circular shape at (228, 177) with radius 11.
; PLAN: r0=228(x), r1=177(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 177
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
