; DESCRIPTION: Creates a white circular shape at (412, 233) with radius 16.
; PLAN: r0=412(x), r1=233(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 233
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
