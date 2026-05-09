; DESCRIPTION: Draws a cyan circle centered at (292, 184) with radius 24.
; PLAN: r0=292(x), r1=184(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 184
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
