; DESCRIPTION: Draws a cyan circle centered at (60, 137) with radius 12.
; PLAN: r0=60(x), r1=137(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 137
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
