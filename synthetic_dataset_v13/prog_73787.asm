; DESCRIPTION: Creates a cyan circular shape at (315, 84) with radius 43.
; PLAN: r0=315(x), r1=84(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 84
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
