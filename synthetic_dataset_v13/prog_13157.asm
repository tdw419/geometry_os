; DESCRIPTION: Creates a white circular shape at (280, 189) with radius 46.
; PLAN: r0=280(x), r1=189(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 189
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
