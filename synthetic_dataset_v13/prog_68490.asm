; DESCRIPTION: Creates a white circular shape at (419, 146) with radius 80.
; PLAN: r0=419(x), r1=146(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 146
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
