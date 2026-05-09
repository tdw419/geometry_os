; DESCRIPTION: Draws a cyan circle centered at (74, 78) with radius 50.
; PLAN: r0=74(x), r1=78(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 78
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
