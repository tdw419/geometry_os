; DESCRIPTION: Draws a white circle centered at (94, 218) with radius 28.
; PLAN: r0=94(x), r1=218(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 218
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
