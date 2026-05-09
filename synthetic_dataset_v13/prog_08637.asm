; DESCRIPTION: Draws a cyan circle centered at (23, 49) with radius 12.
; PLAN: r0=23(x), r1=49(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 49
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
