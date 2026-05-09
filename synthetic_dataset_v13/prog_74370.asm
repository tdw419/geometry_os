; DESCRIPTION: Draws a cyan circle centered at (141, 75) with radius 63.
; PLAN: r0=141(x), r1=75(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 75
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
