; DESCRIPTION: Draws a cyan circle centered at (208, 183) with radius 63.
; PLAN: r0=208(x), r1=183(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 183
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
