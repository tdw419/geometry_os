; DESCRIPTION: Creates a cyan circular shape at (128, 197) with radius 33.
; PLAN: r0=128(x), r1=197(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 197
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
