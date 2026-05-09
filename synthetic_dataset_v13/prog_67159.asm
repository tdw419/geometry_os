; DESCRIPTION: Draws a cyan circle centered at (459, 80) with radius 51.
; PLAN: r0=459(x), r1=80(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 80
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
