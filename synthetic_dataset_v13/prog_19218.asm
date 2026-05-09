; DESCRIPTION: Creates a cyan circular shape at (459, 144) with radius 24.
; PLAN: r0=459(x), r1=144(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 144
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
