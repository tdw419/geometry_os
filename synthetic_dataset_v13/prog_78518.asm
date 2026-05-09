; DESCRIPTION: Creates a white circular shape at (228, 165) with radius 46.
; PLAN: r0=228(x), r1=165(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 165
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
