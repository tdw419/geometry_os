; DESCRIPTION: Creates a green circular shape at (386, 153) with radius 19.
; PLAN: r0=386(x), r1=153(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 153
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
