; DESCRIPTION: Creates a cyan circular shape at (261, 154) with radius 63.
; PLAN: r0=261(x), r1=154(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 154
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
