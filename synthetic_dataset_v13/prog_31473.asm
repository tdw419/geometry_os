; DESCRIPTION: Creates a white circular shape at (410, 93) with radius 38.
; PLAN: r0=410(x), r1=93(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 93
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
