; DESCRIPTION: Creates a magenta circular shape at (96, 107) with radius 35.
; PLAN: r0=96(x), r1=107(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 107
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
