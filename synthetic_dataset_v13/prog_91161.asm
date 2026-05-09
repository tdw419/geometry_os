; DESCRIPTION: Draws a cyan circle centered at (306, 156) with radius 69.
; PLAN: r0=306(x), r1=156(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 156
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
