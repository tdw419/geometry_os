; DESCRIPTION: Draws a cyan circle centered at (356, 162) with radius 17.
; PLAN: r0=356(x), r1=162(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 162
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
