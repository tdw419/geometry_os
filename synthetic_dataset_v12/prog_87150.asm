; DESCRIPTION: Creates a cyan circular shape at (155, 149) with radius 72.
; PLAN: r0=155(x), r1=149(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 149
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
