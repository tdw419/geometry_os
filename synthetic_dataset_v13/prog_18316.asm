; DESCRIPTION: Draws a cyan circle centered at (170, 62) with radius 24.
; PLAN: r0=170(x), r1=62(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 62
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
