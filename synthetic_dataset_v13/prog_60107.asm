; DESCRIPTION: Draws a cyan circle centered at (286, 153) with radius 60.
; PLAN: r0=286(x), r1=153(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 153
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
