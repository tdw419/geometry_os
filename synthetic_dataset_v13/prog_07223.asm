; DESCRIPTION: Creates a red circular shape at (84, 172) with radius 19.
; PLAN: r0=84(x), r1=172(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 172
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
