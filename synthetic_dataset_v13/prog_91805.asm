; DESCRIPTION: Draws a cyan circle centered at (101, 30) with radius 23.
; PLAN: r0=101(x), r1=30(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 30
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
