; DESCRIPTION: Draws a cyan circle centered at (274, 151) with radius 65.
; PLAN: r0=274(x), r1=151(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 151
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
