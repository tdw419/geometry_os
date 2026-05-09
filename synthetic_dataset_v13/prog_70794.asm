; DESCRIPTION: Creates a yellow circular shape at (386, 87) with radius 59.
; PLAN: r0=386(x), r1=87(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 87
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
