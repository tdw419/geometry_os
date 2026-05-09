; DESCRIPTION: Creates a white circular shape at (153, 133) with radius 21.
; PLAN: r0=153(x), r1=133(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 133
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
