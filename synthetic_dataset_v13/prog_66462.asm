; DESCRIPTION: Draws a cyan circle centered at (168, 139) with radius 15.
; PLAN: r0=168(x), r1=139(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 139
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
