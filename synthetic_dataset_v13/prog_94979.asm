; DESCRIPTION: Creates a cyan circular shape at (57, 172) with radius 48.
; PLAN: r0=57(x), r1=172(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 172
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
