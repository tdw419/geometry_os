; DESCRIPTION: Draws a cyan circle centered at (166, 101) with radius 43.
; PLAN: r0=166(x), r1=101(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 101
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
