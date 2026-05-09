; DESCRIPTION: Draws a green circle centered at (131, 171) with radius 65.
; PLAN: r0=131(x), r1=171(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 171
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
