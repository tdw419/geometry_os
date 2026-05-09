; DESCRIPTION: Draws a cyan circle centered at (268, 78) with radius 21.
; PLAN: r0=268(x), r1=78(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 78
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
