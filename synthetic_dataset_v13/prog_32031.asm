; DESCRIPTION: Draws a cyan circle centered at (121, 148) with radius 18.
; PLAN: r0=121(x), r1=148(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 148
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
