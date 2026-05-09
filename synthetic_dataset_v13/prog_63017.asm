; DESCRIPTION: Creates a magenta circular shape at (474, 129) with radius 18.
; PLAN: r0=474(x), r1=129(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 129
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
