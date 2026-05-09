; DESCRIPTION: Creates a cyan circular shape at (84, 210) with radius 29.
; PLAN: r0=84(x), r1=210(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 210
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
