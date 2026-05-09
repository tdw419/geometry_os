; DESCRIPTION: Creates a cyan circular shape at (402, 95) with radius 48.
; PLAN: r0=402(x), r1=95(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 95
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
