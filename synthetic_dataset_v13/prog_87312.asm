; DESCRIPTION: Draws a cyan circle centered at (86, 121) with radius 78.
; PLAN: r0=86(x), r1=121(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 121
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
