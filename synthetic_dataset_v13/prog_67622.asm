; DESCRIPTION: Draws a cyan circle centered at (366, 153) with radius 69.
; PLAN: r0=366(x), r1=153(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 153
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
