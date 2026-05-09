; DESCRIPTION: Creates a cyan circular shape at (379, 58) with radius 27.
; PLAN: r0=379(x), r1=58(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 58
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
