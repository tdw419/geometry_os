; DESCRIPTION: Draws a cyan circle centered at (348, 73) with radius 61.
; PLAN: r0=348(x), r1=73(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 73
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
