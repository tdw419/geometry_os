; DESCRIPTION: Draws a cyan circle centered at (165, 163) with radius 28.
; PLAN: r0=165(x), r1=163(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 163
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
