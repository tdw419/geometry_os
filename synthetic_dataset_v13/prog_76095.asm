; DESCRIPTION: Creates a blue circular shape at (278, 151) with radius 27.
; PLAN: r0=278(x), r1=151(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 151
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
