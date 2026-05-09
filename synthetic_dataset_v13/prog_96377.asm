; DESCRIPTION: Draws a cyan circle centered at (356, 122) with radius 22.
; PLAN: r0=356(x), r1=122(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 122
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
