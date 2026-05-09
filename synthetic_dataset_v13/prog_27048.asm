; DESCRIPTION: Creates a blue circular shape at (48, 46) with radius 44.
; PLAN: r0=48(x), r1=46(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 46
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
