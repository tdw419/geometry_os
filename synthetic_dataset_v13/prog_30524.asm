; DESCRIPTION: Creates a green circular shape at (73, 93) with radius 29.
; PLAN: r0=73(x), r1=93(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 93
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
