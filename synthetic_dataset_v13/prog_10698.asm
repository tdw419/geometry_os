; DESCRIPTION: Creates a cyan circular shape at (354, 134) with radius 58.
; PLAN: r0=354(x), r1=134(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 134
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
