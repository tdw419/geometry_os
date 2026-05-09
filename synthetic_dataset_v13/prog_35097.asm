; DESCRIPTION: Creates a cyan circular shape at (395, 115) with radius 63.
; PLAN: r0=395(x), r1=115(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 115
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
