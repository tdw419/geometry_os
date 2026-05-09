; DESCRIPTION: Creates a cyan circular shape at (401, 56) with radius 14.
; PLAN: r0=401(x), r1=56(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 56
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
