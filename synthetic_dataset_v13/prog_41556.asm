; DESCRIPTION: Draws a cyan circle centered at (184, 157) with radius 71.
; PLAN: r0=184(x), r1=157(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 157
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
