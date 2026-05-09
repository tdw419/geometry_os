; DESCRIPTION: Draws a cyan circle centered at (414, 101) with radius 27.
; PLAN: r0=414(x), r1=101(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 101
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
