; DESCRIPTION: Creates a white circular shape at (385, 169) with radius 60.
; PLAN: r0=385(x), r1=169(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 169
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
