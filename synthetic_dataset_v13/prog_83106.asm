; DESCRIPTION: Draws a cyan circle centered at (268, 49) with radius 19.
; PLAN: r0=268(x), r1=49(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 49
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
