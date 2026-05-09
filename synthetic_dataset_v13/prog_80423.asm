; DESCRIPTION: Draws a cyan circle centered at (181, 163) with radius 27.
; PLAN: r0=181(x), r1=163(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 163
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
