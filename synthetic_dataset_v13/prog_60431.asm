; DESCRIPTION: Draws a cyan circle centered at (111, 140) with radius 75.
; PLAN: r0=111(x), r1=140(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 140
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
