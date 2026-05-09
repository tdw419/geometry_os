; DESCRIPTION: Creates a cyan circular shape at (349, 140) with radius 79.
; PLAN: r0=349(x), r1=140(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 140
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
