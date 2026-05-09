; DESCRIPTION: Creates a cyan circular shape at (114, 84) with radius 54.
; PLAN: r0=114(x), r1=84(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 84
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
