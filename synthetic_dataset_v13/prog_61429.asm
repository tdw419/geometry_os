; DESCRIPTION: Creates a magenta circular shape at (264, 40) with radius 10.
; PLAN: r0=264(x), r1=40(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 40
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
