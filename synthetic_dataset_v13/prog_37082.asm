; DESCRIPTION: Draws a cyan circle centered at (183, 76) with radius 27.
; PLAN: r0=183(x), r1=76(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 76
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
