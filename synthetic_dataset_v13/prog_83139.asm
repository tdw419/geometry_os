; DESCRIPTION: Creates a cyan circular shape at (209, 84) with radius 74.
; PLAN: r0=209(x), r1=84(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 84
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
