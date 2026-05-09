; DESCRIPTION: Draws a red circle centered at (294, 155) with radius 61.
; PLAN: r0=294(x), r1=155(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 155
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
