; DESCRIPTION: Draws a red circle centered at (199, 18) with radius 18.
; PLAN: r0=199(x), r1=18(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 18
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
