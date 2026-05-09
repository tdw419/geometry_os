; DESCRIPTION: Creates a cyan circular shape at (430, 147) with radius 35.
; PLAN: r0=430(x), r1=147(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 147
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
