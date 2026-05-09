; DESCRIPTION: Draws a blue circle centered at (426, 93) with radius 77.
; PLAN: r0=426(x), r1=93(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 93
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
