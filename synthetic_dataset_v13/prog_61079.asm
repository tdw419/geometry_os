; DESCRIPTION: Draws a cyan circle centered at (88, 122) with radius 51.
; PLAN: r0=88(x), r1=122(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 122
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
