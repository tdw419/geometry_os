; DESCRIPTION: Creates a cyan circular shape at (430, 135) with radius 59.
; PLAN: r0=430(x), r1=135(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 135
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
