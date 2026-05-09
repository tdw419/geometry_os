; DESCRIPTION: Creates a cyan circular shape at (216, 112) with radius 78.
; PLAN: r0=216(x), r1=112(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 112
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
