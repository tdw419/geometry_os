; DESCRIPTION: Draws a cyan circle centered at (261, 85) with radius 74.
; PLAN: r0=261(x), r1=85(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 85
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
