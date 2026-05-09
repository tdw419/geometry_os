; DESCRIPTION: Creates a cyan circular shape at (468, 59) with radius 31.
; PLAN: r0=468(x), r1=59(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 59
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
