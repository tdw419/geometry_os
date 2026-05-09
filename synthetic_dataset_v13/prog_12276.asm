; DESCRIPTION: Creates a cyan circular shape at (195, 168) with radius 17.
; PLAN: r0=195(x), r1=168(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 168
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
