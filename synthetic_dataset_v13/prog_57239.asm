; DESCRIPTION: Creates a green circular shape at (262, 64) with radius 50.
; PLAN: r0=262(x), r1=64(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 64
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
