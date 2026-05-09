; DESCRIPTION: Draws a red circle centered at (327, 233) with radius 19.
; PLAN: r0=327(x), r1=233(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 233
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
