; DESCRIPTION: Creates a cyan circular shape at (308, 167) with radius 46.
; PLAN: r0=308(x), r1=167(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 167
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
