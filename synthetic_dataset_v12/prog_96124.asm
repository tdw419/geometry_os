; DESCRIPTION: Creates a cyan circular shape at (165, 81) with radius 27.
; PLAN: r0=165(x), r1=81(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 81
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
