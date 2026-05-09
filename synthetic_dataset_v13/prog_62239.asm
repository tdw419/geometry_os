; DESCRIPTION: Draws a cyan circle centered at (134, 177) with radius 51.
; PLAN: r0=134(x), r1=177(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 177
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
