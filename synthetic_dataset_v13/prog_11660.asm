; DESCRIPTION: Creates a cyan circular shape at (324, 79) with radius 64.
; PLAN: r0=324(x), r1=79(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 79
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
