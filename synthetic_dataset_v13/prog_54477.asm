; DESCRIPTION: Draws a white circle centered at (140, 131) with radius 36.
; PLAN: r0=140(x), r1=131(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 131
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
