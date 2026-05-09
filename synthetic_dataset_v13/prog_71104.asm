; DESCRIPTION: Creates a cyan circular shape at (234, 204) with radius 23.
; PLAN: r0=234(x), r1=204(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 204
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
