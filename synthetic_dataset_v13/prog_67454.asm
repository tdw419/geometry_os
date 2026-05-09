; DESCRIPTION: Creates a cyan circular shape at (420, 81) with radius 80.
; PLAN: r0=420(x), r1=81(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 81
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
