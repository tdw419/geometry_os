; DESCRIPTION: Creates a white circular shape at (325, 133) with radius 72.
; PLAN: r0=325(x), r1=133(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 133
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
