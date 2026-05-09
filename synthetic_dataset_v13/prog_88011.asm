; DESCRIPTION: Creates a yellow circular shape at (60, 98) with radius 44.
; PLAN: r0=60(x), r1=98(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 98
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
