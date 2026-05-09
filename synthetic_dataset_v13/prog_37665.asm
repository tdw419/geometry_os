; DESCRIPTION: Creates a cyan circular shape at (189, 107) with radius 18.
; PLAN: r0=189(x), r1=107(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 107
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
