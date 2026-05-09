; DESCRIPTION: Creates a cyan circular shape at (349, 88) with radius 36.
; PLAN: r0=349(x), r1=88(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 88
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
