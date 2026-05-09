; DESCRIPTION: Draws a cyan circle centered at (399, 52) with radius 28.
; PLAN: r0=399(x), r1=52(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 52
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
