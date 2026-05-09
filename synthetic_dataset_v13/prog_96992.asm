; DESCRIPTION: Draws a red circle centered at (188, 171) with radius 20.
; PLAN: r0=188(x), r1=171(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 171
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
