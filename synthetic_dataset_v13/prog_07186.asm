; DESCRIPTION: Draws a cyan circle centered at (185, 96) with radius 56.
; PLAN: r0=185(x), r1=96(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 96
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
