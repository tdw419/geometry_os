; DESCRIPTION: Creates a cyan circular shape at (370, 88) with radius 59.
; PLAN: r0=370(x), r1=88(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 88
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
