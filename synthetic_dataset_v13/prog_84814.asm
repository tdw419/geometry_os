; DESCRIPTION: Creates a green circular shape at (48, 93) with radius 25.
; PLAN: r0=48(x), r1=93(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 93
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
