; DESCRIPTION: Draws a red circle centered at (178, 171) with radius 37.
; PLAN: r0=178(x), r1=171(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 171
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
