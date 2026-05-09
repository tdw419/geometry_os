; DESCRIPTION: Draws a cyan circle centered at (459, 56) with radius 15.
; PLAN: r0=459(x), r1=56(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 56
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
