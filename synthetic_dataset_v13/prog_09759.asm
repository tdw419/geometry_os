; DESCRIPTION: Creates a blue circular shape at (481, 129) with radius 31.
; PLAN: r0=481(x), r1=129(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 129
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
