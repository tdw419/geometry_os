; DESCRIPTION: Draws a cyan circle centered at (84, 88) with radius 72.
; PLAN: r0=84(x), r1=88(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 88
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
