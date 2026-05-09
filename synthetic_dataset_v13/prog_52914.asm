; DESCRIPTION: Creates a cyan circular shape at (136, 84) with radius 58.
; PLAN: r0=136(x), r1=84(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 84
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
