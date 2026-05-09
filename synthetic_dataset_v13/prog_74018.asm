; DESCRIPTION: Creates a cyan circular shape at (333, 52) with radius 16.
; PLAN: r0=333(x), r1=52(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 52
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
