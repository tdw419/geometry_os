; DESCRIPTION: Creates a cyan circular shape at (113, 65) with radius 53.
; PLAN: r0=113(x), r1=65(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 65
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
