; DESCRIPTION: Creates a cyan circular shape at (375, 136) with radius 55.
; PLAN: r0=375(x), r1=136(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 136
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
