; DESCRIPTION: Draws a cyan circle centered at (329, 69) with radius 51.
; PLAN: r0=329(x), r1=69(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 69
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
