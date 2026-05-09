; DESCRIPTION: Creates a cyan circular shape at (127, 232) with radius 24.
; PLAN: r0=127(x), r1=232(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 232
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
