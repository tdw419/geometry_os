; DESCRIPTION: Draws a cyan circle centered at (331, 125) with radius 78.
; PLAN: r0=331(x), r1=125(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 125
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
