; DESCRIPTION: Draws a cyan circle centered at (125, 115) with radius 73.
; PLAN: r0=125(x), r1=115(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 115
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
