; DESCRIPTION: Creates a yellow circular shape at (460, 58) with radius 44.
; PLAN: r0=460(x), r1=58(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 58
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
