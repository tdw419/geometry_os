; DESCRIPTION: Creates a cyan circular shape at (84, 135) with radius 47.
; PLAN: r0=84(x), r1=135(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 135
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
