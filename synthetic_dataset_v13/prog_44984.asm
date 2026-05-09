; DESCRIPTION: Draws a cyan circle centered at (72, 92) with radius 35.
; PLAN: r0=72(x), r1=92(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 92
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
