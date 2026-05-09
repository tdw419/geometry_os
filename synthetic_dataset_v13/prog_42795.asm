; DESCRIPTION: Draws a cyan circle centered at (121, 145) with radius 23.
; PLAN: r0=121(x), r1=145(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 145
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
