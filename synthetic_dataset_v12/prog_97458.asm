; DESCRIPTION: Draws a cyan circle centered at (121, 162) with radius 30.
; PLAN: r0=121(x), r1=162(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 162
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
