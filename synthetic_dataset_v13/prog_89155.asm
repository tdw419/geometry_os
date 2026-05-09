; DESCRIPTION: Draws a cyan circle centered at (116, 172) with radius 53.
; PLAN: r0=116(x), r1=172(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 172
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
