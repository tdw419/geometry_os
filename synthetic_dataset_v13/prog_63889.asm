; DESCRIPTION: Draws a red circle centered at (131, 189) with radius 52.
; PLAN: r0=131(x), r1=189(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 189
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
