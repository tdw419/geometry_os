; DESCRIPTION: Creates a white circular shape at (393, 74) with radius 21.
; PLAN: r0=393(x), r1=74(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 74
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
