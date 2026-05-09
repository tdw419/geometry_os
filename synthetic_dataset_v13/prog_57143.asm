; DESCRIPTION: Draws a cyan circle centered at (380, 148) with radius 53.
; PLAN: r0=380(x), r1=148(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 148
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
