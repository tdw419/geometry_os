; DESCRIPTION: Creates a white circular shape at (135, 131) with radius 43.
; PLAN: r0=135(x), r1=131(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 131
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
