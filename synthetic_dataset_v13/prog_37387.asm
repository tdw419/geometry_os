; DESCRIPTION: Creates a cyan circular shape at (294, 155) with radius 52.
; PLAN: r0=294(x), r1=155(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 155
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
