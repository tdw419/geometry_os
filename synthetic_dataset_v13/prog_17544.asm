; DESCRIPTION: Creates a green circular shape at (103, 185) with radius 32.
; PLAN: r0=103(x), r1=185(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 185
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
