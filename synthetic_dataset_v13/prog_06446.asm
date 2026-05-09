; DESCRIPTION: Creates a cyan circular shape at (181, 108) with radius 55.
; PLAN: r0=181(x), r1=108(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 108
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
