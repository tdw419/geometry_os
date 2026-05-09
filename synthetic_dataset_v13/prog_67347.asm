; DESCRIPTION: Creates a yellow circular shape at (420, 73) with radius 48.
; PLAN: r0=420(x), r1=73(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 73
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
