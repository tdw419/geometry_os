; DESCRIPTION: Creates a cyan circular shape at (164, 117) with radius 17.
; PLAN: r0=164(x), r1=117(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 117
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
