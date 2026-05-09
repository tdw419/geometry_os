; DESCRIPTION: Draws a cyan circle centered at (245, 157) with radius 49.
; PLAN: r0=245(x), r1=157(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 157
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
