; DESCRIPTION: Draws a red circle centered at (418, 81) with radius 52.
; PLAN: r0=418(x), r1=81(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 81
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
