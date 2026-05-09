; DESCRIPTION: Draws a cyan circle centered at (332, 188) with radius 34.
; PLAN: r0=332(x), r1=188(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 188
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
