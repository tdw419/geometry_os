; DESCRIPTION: Creates a cyan circular shape at (145, 151) with radius 77.
; PLAN: r0=145(x), r1=151(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 151
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
