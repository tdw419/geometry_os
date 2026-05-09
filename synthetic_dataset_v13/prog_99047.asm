; DESCRIPTION: Draws a cyan circle centered at (115, 105) with radius 29.
; PLAN: r0=115(x), r1=105(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 105
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
