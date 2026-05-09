; DESCRIPTION: Creates a cyan circular shape at (229, 68) with radius 12.
; PLAN: r0=229(x), r1=68(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 68
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
