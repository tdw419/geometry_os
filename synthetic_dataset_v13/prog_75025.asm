; DESCRIPTION: Creates a blue circular shape at (380, 126) with radius 77.
; PLAN: r0=380(x), r1=126(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 126
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
