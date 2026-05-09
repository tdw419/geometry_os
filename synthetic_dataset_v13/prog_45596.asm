; DESCRIPTION: Draws a cyan circle centered at (343, 164) with radius 73.
; PLAN: r0=343(x), r1=164(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 164
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
