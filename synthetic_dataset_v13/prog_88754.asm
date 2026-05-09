; DESCRIPTION: Creates a cyan circular shape at (127, 78) with radius 74.
; PLAN: r0=127(x), r1=78(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 78
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
