; DESCRIPTION: Draws a red circle centered at (419, 56) with radius 54.
; PLAN: r0=419(x), r1=56(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 56
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
