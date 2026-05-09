; DESCRIPTION: Draws a cyan circle centered at (85, 19) with radius 16.
; PLAN: r0=85(x), r1=19(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 19
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
