; DESCRIPTION: Creates a cyan circular shape at (182, 245) with radius 10.
; PLAN: r0=182(x), r1=245(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 245
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
