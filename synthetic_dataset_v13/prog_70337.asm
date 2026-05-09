; DESCRIPTION: Creates a cyan circular shape at (333, 191) with radius 54.
; PLAN: r0=333(x), r1=191(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 191
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
