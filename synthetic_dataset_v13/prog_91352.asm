; DESCRIPTION: Draws a cyan circle centered at (75, 137) with radius 16.
; PLAN: r0=75(x), r1=137(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 137
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
