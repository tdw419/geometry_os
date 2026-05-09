; DESCRIPTION: Creates a yellow circular shape at (165, 120) with radius 49.
; PLAN: r0=165(x), r1=120(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 120
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
