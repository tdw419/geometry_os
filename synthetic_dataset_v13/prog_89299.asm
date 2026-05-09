; DESCRIPTION: Draws a cyan circle centered at (447, 57) with radius 53.
; PLAN: r0=447(x), r1=57(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 57
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
