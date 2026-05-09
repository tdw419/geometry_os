; DESCRIPTION: Draws a red circle centered at (421, 196) with radius 10.
; PLAN: r0=421(x), r1=196(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 196
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
