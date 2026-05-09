; DESCRIPTION: Creates a white circular shape at (186, 62) with radius 27.
; PLAN: r0=186(x), r1=62(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 62
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
