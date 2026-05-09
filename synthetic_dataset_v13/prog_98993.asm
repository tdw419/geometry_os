; DESCRIPTION: Creates a white circular shape at (36, 180) with radius 27.
; PLAN: r0=36(x), r1=180(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 180
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
