; DESCRIPTION: Creates a cyan circular shape at (208, 189) with radius 13.
; PLAN: r0=208(x), r1=189(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 189
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
