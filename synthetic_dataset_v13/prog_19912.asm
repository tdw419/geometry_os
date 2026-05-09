; DESCRIPTION: Creates a cyan circular shape at (127, 192) with radius 10.
; PLAN: r0=127(x), r1=192(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 192
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
