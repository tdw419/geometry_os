; DESCRIPTION: Creates a blue circular shape at (373, 129) with radius 77.
; PLAN: r0=373(x), r1=129(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 129
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
