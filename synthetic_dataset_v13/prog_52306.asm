; DESCRIPTION: Draws a white circle centered at (131, 93) with radius 23.
; PLAN: r0=131(x), r1=93(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 93
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
