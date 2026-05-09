; DESCRIPTION: Creates a blue circular shape at (103, 191) with radius 27.
; PLAN: r0=103(x), r1=191(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 191
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
