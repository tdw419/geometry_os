; DESCRIPTION: Draws a red circle centered at (285, 83) with radius 46.
; PLAN: r0=285(x), r1=83(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 83
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
