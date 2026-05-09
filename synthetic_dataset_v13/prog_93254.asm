; DESCRIPTION: Creates a cyan circular shape at (143, 69) with radius 40.
; PLAN: r0=143(x), r1=69(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 69
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
