; DESCRIPTION: Draws a cyan circle centered at (115, 45) with radius 26.
; PLAN: r0=115(x), r1=45(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 45
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
