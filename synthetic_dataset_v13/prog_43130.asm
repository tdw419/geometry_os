; DESCRIPTION: Creates a white circular shape at (222, 72) with radius 63.
; PLAN: r0=222(x), r1=72(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 72
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
