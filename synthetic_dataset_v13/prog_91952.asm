; DESCRIPTION: Creates a cyan circular shape at (38, 81) with radius 20.
; PLAN: r0=38(x), r1=81(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 81
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
