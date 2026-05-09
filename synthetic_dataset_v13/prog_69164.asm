; DESCRIPTION: Draws a cyan circle centered at (244, 125) with radius 51.
; PLAN: r0=244(x), r1=125(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 125
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
