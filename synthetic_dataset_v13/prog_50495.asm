; DESCRIPTION: Creates a cyan circular shape at (363, 134) with radius 14.
; PLAN: r0=363(x), r1=134(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 134
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
