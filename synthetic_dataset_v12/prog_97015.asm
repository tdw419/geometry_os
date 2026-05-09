; DESCRIPTION: Places a cyan circle of radius 78 at center (104, 88).
; PLAN: r0=104(x), r1=88(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 88
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
