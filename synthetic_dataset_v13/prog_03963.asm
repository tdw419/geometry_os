; DESCRIPTION: Creates a cyan circular shape at (263, 28) with radius 10.
; PLAN: r0=263(x), r1=28(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 28
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
