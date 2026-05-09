; DESCRIPTION: Draws a red circle centered at (264, 171) with radius 79.
; PLAN: r0=264(x), r1=171(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 171
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
