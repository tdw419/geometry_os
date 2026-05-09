; DESCRIPTION: Creates a cyan circular shape at (316, 138) with radius 32.
; PLAN: r0=316(x), r1=138(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 138
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
