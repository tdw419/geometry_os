; DESCRIPTION: Creates a cyan circular shape at (413, 139) with radius 59.
; PLAN: r0=413(x), r1=139(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 139
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
