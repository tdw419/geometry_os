; DESCRIPTION: Creates a cyan circular shape at (192, 133) with radius 47.
; PLAN: r0=192(x), r1=133(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 133
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
