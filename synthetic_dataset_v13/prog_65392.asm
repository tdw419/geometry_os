; DESCRIPTION: Draws a cyan circle centered at (145, 111) with radius 74.
; PLAN: r0=145(x), r1=111(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 111
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
