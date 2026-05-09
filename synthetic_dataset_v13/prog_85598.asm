; DESCRIPTION: Draws a cyan circle centered at (74, 52) with radius 32.
; PLAN: r0=74(x), r1=52(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 52
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
