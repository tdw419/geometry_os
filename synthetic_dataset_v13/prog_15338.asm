; DESCRIPTION: Creates a cyan circular shape at (192, 60) with radius 50.
; PLAN: r0=192(x), r1=60(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 60
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
