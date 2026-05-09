; DESCRIPTION: Draws a cyan circle centered at (183, 140) with radius 17.
; PLAN: r0=183(x), r1=140(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 140
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
