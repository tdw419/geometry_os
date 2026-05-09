; DESCRIPTION: Creates a cyan circular shape at (84, 78) with radius 48.
; PLAN: r0=84(x), r1=78(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 78
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
