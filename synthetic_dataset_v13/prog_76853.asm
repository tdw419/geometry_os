; DESCRIPTION: Draws a red circle centered at (124, 196) with radius 52.
; PLAN: r0=124(x), r1=196(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 196
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
