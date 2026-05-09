; DESCRIPTION: Draws a cyan circle centered at (481, 106) with radius 25.
; PLAN: r0=481(x), r1=106(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 106
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
