; DESCRIPTION: Creates a cyan circular shape at (394, 72) with radius 69.
; PLAN: r0=394(x), r1=72(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 72
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
