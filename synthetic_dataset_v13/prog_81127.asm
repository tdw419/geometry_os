; DESCRIPTION: Creates a blue circular shape at (358, 97) with radius 50.
; PLAN: r0=358(x), r1=97(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 97
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
