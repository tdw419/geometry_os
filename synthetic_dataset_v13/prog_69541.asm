; DESCRIPTION: Creates a magenta circular shape at (453, 176) with radius 39.
; PLAN: r0=453(x), r1=176(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 176
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
