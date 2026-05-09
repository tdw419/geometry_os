; DESCRIPTION: Draws a red circle centered at (409, 171) with radius 27.
; PLAN: r0=409(x), r1=171(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 171
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
