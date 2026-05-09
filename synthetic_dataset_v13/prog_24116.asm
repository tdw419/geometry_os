; DESCRIPTION: Draws a red circle centered at (355, 159) with radius 48.
; PLAN: r0=355(x), r1=159(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 159
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
