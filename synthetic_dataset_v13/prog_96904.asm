; DESCRIPTION: Creates a magenta circular shape at (419, 52) with radius 50.
; PLAN: r0=419(x), r1=52(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 52
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
