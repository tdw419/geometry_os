; DESCRIPTION: Draws a cyan circle centered at (439, 102) with radius 53.
; PLAN: r0=439(x), r1=102(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 102
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
