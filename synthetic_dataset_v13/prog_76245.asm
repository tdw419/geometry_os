; DESCRIPTION: Creates a cyan circular shape at (347, 151) with radius 68.
; PLAN: r0=347(x), r1=151(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 151
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
