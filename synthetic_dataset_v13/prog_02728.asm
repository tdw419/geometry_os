; DESCRIPTION: Draws a cyan circle centered at (311, 196) with radius 39.
; PLAN: r0=311(x), r1=196(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 196
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
